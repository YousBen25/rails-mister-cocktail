// config/webpack/environment.js
const { environment } = require('@rails/webpacker')

environment.loaders.delete('nodeModules') // fixed mapbox beug'https://github.com/mapbox/mapbox-gl-js/issues/8574'

// Bootstrap 4 has a dependency over jQuery & Popper.js:
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
