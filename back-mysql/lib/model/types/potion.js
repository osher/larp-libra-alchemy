module.exports = ({
  model,
  logger,
  log = logger.of('types/potion')
}) => model.declare('potion', {
  tableName: 'potion',
  effects() {
      return this.hasMany('potionEffects')
  }
}, {
  all() {
      return this.fetchAll({withRelated:['effects']})
  }
});
