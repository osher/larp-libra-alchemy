module.exports = ({
  log,
  app = require('express')(),
  cors = require('cors'),
  mock = require('../mock/data.json'),
  Promise
}) => {
    app.use(cors());
    app.get('/model', (q,r) => r.json(mock));

    app.post('/potion', (q,r) => r.json({ok: true}));

    app.use((q,r,n) => r.status(404).json({msg:"no such endpoint",path:q.url}));

    return Promise.resolve({
      start: () => new Promise((a,r) => app.svr = app.listen(3030, (e) => e ? r(e) : a(app.svr))),
      stop: () => Promise.promisify(app.svr.close, {context: app.svr})()
    })
};
