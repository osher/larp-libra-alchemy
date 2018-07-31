const CleanDir = require('clean-webpack-plugin')
const CopyDir = require('copy-webpack-plugin')
const HtmlEntry = require('html-webpack-plugin');
const Favicon = require('favicons-webpack-plugin')
const {resolve} = require('path');
module.exports = {
  module: {
    rules: [{
      test: /.js$/,
      loader: 'babel-loader',
      include: resolve(__dirname, 'src')
    }, {
      test: /.css$/,
      loaders: ['style-loader', 'css-loader']
    }]
  },
  plugins: [
    new CleanDir(['dist']),
    new CopyDir([{
      from:   'src/assets',
      to:     'dist/assets'
    }]),
    new HtmlEntry({
      title:  'Libra - Alchemy Lab'
    }),
    new Favicon('./src/assets/alchemy-favicon.png')
  ],
  entry: {
    main: './src',
    vendors: ['axios']
  },
  devtool: 'source-map',
  optimization: {
    splitChunks: {
      cacheGroups: {
        vendors: {
          chunks: 'initial',
            name: 'vendors',
            test: 'vendors',
            enforce: true
        },
      }
    }
  }
};