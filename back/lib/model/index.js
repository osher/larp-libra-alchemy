module.exports = ({
  config,
  logger,
  Promise
}) => {
    const mockData = require('../../mock/data');
    const log = logger.of('lib/model');
    log.debug('initializing');
    //TBD - connect to DB...

    return Promise.resolve({
      initView, 
      createPotion
    });

    function initView() {
        log.debug('initView');
        //TBD - query db && formulate view
        return Promise.resolve(mockData)
    }

    function createPotion(potion) {
        log.debug({potion}, 'createPotion');
        return Promise.reject(new Error('not implemented'));
    }
};
