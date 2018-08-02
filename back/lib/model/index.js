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
      }) => [id, power, name, description, antigens.map( ({attributes: {counter_id: id}}) => id )],

      specialIngredient: ({
        attributes: {id, name, power, comment},
        relations: {alterations: {models: alterations}}
      }) => [id, power, name, comment, alterations.reduce(
        (alterations, {
          attributes: {old_effect_id: from, new_effect_id: to}
        }) => assign(alterations, {[from]: to}),
        {}
      )],

      product: ({
        attributes: {id, ingredient_id: ingr, procedure_id: proc, main_effect_id: main},
        relations: { effects: {models: effects}}
      }) => [id, ingr, proc, main, effects.map( ({attributes: {effect_id: id}}) => id )],

      potion: ({
        attributes: {id, name, description, creator_name},
        relations: { effects: {models: effects}}
      }) => [id, name, creator_name, description].concat(
        effects.map(({attributes: {effect_id: id, effect_level: lvl}}) => [id, lvl])
      )
    }

    log.debug('initializing');

    return modelMgr(ioc)
    .then((model) => ({
      initView: () => initView(model), 
      createPotion: (potion) => createPotion(model, potion)
    }));

    function initView({ingredient, procedure, effect, specialIngredient, product, potion}) {
        log.debug('initView');
        
        if (config.web.mockData) return Promise.resolve(mockData);

        return Promise.all([
          effect.all(),
          specialIngredient.all(),
          ingredient.all(),
          procedure.all(),
          product.all(),
          potion.all()
        ]).then(([
          effects,
          specialIngredients,
          ingredients,
          procedures,
          products,
          potions
        ]) => ({
          effects:           effects.map(mapper.effect),
          specialIngredient: specialIngredients.map(mapper.specialIngredient),
          ingredients:       ingredients.map(mapper.idName),
          procedures:        procedures.map(mapper.idName),
          product:           products.map(mapper.product),
          potion:            potions.map(mapper.potion)
        }));
    }

    function createPotion(potion) {
        log.debug({potion}, 'createPotion');
        return Promise.reject(new Error('not implemented'));
    }
};
