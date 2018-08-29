const config = {
  dev: {
    SVR: 'http://localhost:3030'
  }
};

module.exports = (env) => {
    return config[env] || config.dev
}