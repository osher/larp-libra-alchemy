module.exports = ({
  model,
  logger,
  log = logger.of('types/antigen')
}) => model.declare('antigen', {
  tableName: 'antigen'
});
