module.exports = (ioc) => {
    const {
      Promise,
      config,
      logger,
      log = logger.of('lib/model'),
      //
      mockData = require('../../mock/data'),
      modelMgr = require('./mgr')
    } = ioc;

    const {assign} = Object;
    const mapper = {
      idName: ({attributes: {id, name}}) => [id, name],

      ids: ({attributes: {id}}) => id,

      effect: ({
        attributes: {id, name, power, description},
        relations: {antigens: {models: antigens}}
      }) => [id, power, name, description, antigens.map( ({attributes: {counter_id: id}}) => Number(id) )],

      specialIngredient: ({
        attributes: {id, name, power, comment},
        relations: {alterations: {models: alterations}}
      }) => [id, power, name, comment, alterations.reduce(
        (alterations, {
          attributes: {old_effect_id: from, new_effect_id: to}
        }) => assign(alterations, {[from]: to}),
        {}
      )]
    }

    log.debug('initializing');

    return modelMgr(ioc)
    .then((model) => ({
      initView: () => initView(model), 
      createPotion: (potion) => createPotion(model, potion)
    }));

    function initView({ingredient, procedure, effect, specialIngredient}) {
        log.debug('initView');
        
        if (config.web.mockData) return Promise.resolve(mockData);

        return Promise.all([
          effect.all(),
          specialIngredient.all(), 
          ingredient.all(), 
          procedure.all(), 
          //product, 
          //potion
        ]).then(([
          effects,
          specialIngredients,
          ingredients,
          procedures,
          //product,
          //potion
        ]) => ({
          effects:           effects.map(mapper.effect),
          specialIngredient: specialIngredients.map(mapper.specialIngredient),
          ingredients:       ingredients.map(mapper.idName),
          procedures:        procedures.map(mapper.idName),
          product:           [],
          potion:            []
        }));
    }

    function createPotion(potion) {
        log.debug({potion}, 'createPotion');
        return Promise.reject(new Error('not implemented'));
    }
};
