module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    'node_modules/preline/dist/*.js'
  ],
  plugins: [
    require('tailwindcss'),
    require('autoprefixer'),
    require('preline/plugin'),
  ]
}
