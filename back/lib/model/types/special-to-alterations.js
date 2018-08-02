module.exports = ({
  model,
  logger,
  log = logger.of('types/alterations')
}) => model.declare('specialToalterations', {
  tableName: 'special_to_effect'
});
