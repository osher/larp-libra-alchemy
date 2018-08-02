module.exports = ({
  config,
  logger,
  model,
  app         = require('express')(),
  cors        = require('cors'),
  bodyParser  = require('body-parser'),
  reqLog      = require('express-pino-logger'),
}) => {
    app.disable('x-powered-by');
    app.disable('etag');
    app.use(cors());
    app.use(bodyParser.json());
    app.use(reqLog({logger}));

    app.get('/model', (q, a, n) => {
        model.initView()
        .then(v => a.json(v))
        .catch(n)
    });

    app.post('/potion', ({body: potion}, a, n) => {
        model.createPotion(potion)
        .then(v => a.json(v))
        .catch(n)
    });

    app.use((q, a) => a.status(404).json({msg: 'no such endpoint', path: q.url}));
    app.use((err, req, res, n) => {
        try {
            res.status(err.statusCode || 500)
            .json({error: err.toJSON()});
        } catch(ex) {
            res.end( inspect(err) )
        }
    });
    
    return app;
};
