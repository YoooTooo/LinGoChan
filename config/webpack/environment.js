
const { environment } = require('@rails/webpacker')

//VueLoaderPluginのための記述
const VueLoaderPlugin = require('vue-loader/lib/plugin');
const vue = require('./loaders/vue')

const webpack = require('webpack')
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery/src/jquery',
  jQuery: 'jquery/src/jquery',
  jquery: 'jquery',
  'window.jQuery': 'jquery',
  Popper: ['popper.js', 'default']
}))

// resolve-url-loader用↓
environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
})

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
module.exports = environment


//VueLoaderPluginのための記述その2
environment.loaders.append('vue', {
    test: /\.vue$/,
    loader: 'vue-loader'
});
