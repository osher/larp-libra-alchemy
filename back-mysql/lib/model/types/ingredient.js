module.exports = ({
  model, 
  logger, 
  log = logger.of('types/ingredient')
}) => model.declare('ingredient', {
  tableName: 'ingredient'
}, {
  all() {
      return this.findAll()
  }
});
