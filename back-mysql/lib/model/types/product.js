module.exports = ({
  model,
  logger,
  log = logger.of('types/product')
}) => model.declare('product', {
  tableName: 'product',
  effects() {
      return this.hasMany('productEffects')
  }
}, {
  all() {
      return this.fetchAll({withRelated:['effects']})
  }
});
