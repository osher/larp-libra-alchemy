module.exports = ({
  model,
  logger,
  log = logger.of('types/pot.effects')
}) => model.declare('potionEffects', {
  tableName: 'potion_effects'
});
