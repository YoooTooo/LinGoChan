const { environment } = require('@rails/webpacker')

module.exports = environment
<<<<<<< HEAD


const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
=======
>>>>>>> modified_static_pages
