module.exports = ({
  model,
  logger,
  log = logger.of('types/prod.effects')
}) => model.declare('productEffects', {
  tableName: 'product_to_effect'
});
