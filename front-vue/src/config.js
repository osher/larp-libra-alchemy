const config = {
  dev: {
    SVR: 'http://localhost:3030'
  },
  'alchemy.libra.co.il': {
    SRV: 'http://alchemy.libra.co.il/'
  }
};

module.exports = (env) => {
    return config[env] || config.dev
}