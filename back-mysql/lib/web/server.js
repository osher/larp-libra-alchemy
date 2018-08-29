module.exports = ({
  config,
  logger,
  model,
  app         = require('express')(),
  cors        = require('cors'),
  bodyParser  = require('body-parser'),
  reqLog      = require('express-pino-logger'),
  io          = require('socket.io'),
}) => {
    app.disable('x-powered-by');
    app.disable('etag');
    app.use(cors());
    app.use(bodyParser.json());
    app.use(reqLog({logger}));

    app.get('/model', (q, a, n) => {
        model.initView()
        .then(v => a.json(v))
        .catch(n)
    });

    app.post('/potion', ({body: potion}, a, n) => {
        model.createPotion(potion)
        .then(v => a.json(v))
        .catch(n)
    });

    app.use((q, a) => a.status(404).json({msg: 'no such endpoint', path: q.url}));
    app.use((err, req, res, n) => {
        req.log.error({err}, 'error');
        try {
            res.status(err.statusCode || 500)
            .json({error: err.toJSON()});
        } catch(ex) {
            res.end( inspect(err) )
        }
    });
    const web = require('http').createServer(app);
/*
    {
      const log = logger.of('sockets');
      const channel = io(web).on('connection', (skt) => {
          log.info('user connected');

          skt.on('disconnect', () => {
              console.log('user disconnected');
          });
      });

      web.msg => 
    }*/
    
    return web;
};
