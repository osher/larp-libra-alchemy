//require('error-stringify')({splitStackTrace:true, includeProto: true});
process.env.DEBUG = 'back-mock*';

const {assign} = Object;
const pkg = require('../package');
const log = require('debug')(pkg.name);
const ioc = {
  pkg,
  log,
  Promise: require('bluebird'),
};
process.title = pkg.name;
const graceCount = 3;
const graceTimeout = 10000;

log('initializing');

require('../lib')(ioc)
.then((svc) => {
    ioc.svc = svc;

    process.on('SIGINT', terminate('SIGINT'));
    process.on('SIGTERM', terminate('SIGTERM'));
    process.on('uncaughtException', terminate('error'));
    process.on('unhandledRejection', terminate('reject'));
    process.on('exit', () => log('exitting'));

    log('starting up');
    return svc.start();
})
.then((svr) =>
  assign(ioc, {svr})
  && log({address: svr.address()}, 'web service started')
);

function terminate(cause) {
    return (errOrCode) => {
        const isErr = errOrCode instanceof Error;
        log(
          isErr
            ? { cause, err:  errOrCode }
            : { cause, code: errOrCode },
          'termination'
        );
        const count = terminate.count = (terminate.count || 0) + 1
        if (count >= graceCount) {
            terminated('UNGRACEFUL SHUTDOWN');
            return process.exit(1);
        }

        if (terminate.exitting) {
            return log('termination already in progress');
        }

        terminate.exitting = true;
        ioc.svc.stop().then(terminated);
        setTimeout(() => terminated('grace timeout'), graceTimeout).unref()
    }
}

function terminated(e) {
    log('terminated', e || 'OK')
}
