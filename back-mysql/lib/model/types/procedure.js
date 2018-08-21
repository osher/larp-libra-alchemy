module.exports = ({
  model,
  logger,
  log = logger.of('types/procedure')
}) => model.declare('procedure', {
  tableName: 'procedure'
}, {
  all() {
      return this.findAll()
  }
});
