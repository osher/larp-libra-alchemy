module.exports = ({
  model,
  logger,
  log = logger.of('types/specialIngredient')
}) => model.declare('specialIngredient', {
  tableName: 'special',
  alterations() {
      return this.hasMany('specialToalterations')
  }
}, {
  all() {
      return this.fetchAll({withRelated:['alterations']})
  }
});
