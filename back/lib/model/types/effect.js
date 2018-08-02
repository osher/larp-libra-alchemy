module.exports = ({
  model,
  logger,
  log = logger.of('types/effect')
}) => model.declare('effect', {
  tableName: 'effect',
  antigens() {
      return this.hasMany('antigen')
  }
}, {
  all() {
      return this.fetchAll({withRelated:['antigens']})
  }
});
