# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Config
# https://middlemanapp.com/advanced/configuration/

config[:frontmatter_delims][:yaml] << %w(... ...)
config[:sass_assets_paths] << File.dirname(__FILE__) + '/node_modules'

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

%w(
  any-level
  1-level
).each do |filter|
  proxy "/#{filter}.html", '/index.html', locals: {
      filter: filter,
  }
end

data.services.keys.each do |service|
  proxy "/services/#{service}.html", '/services.html', locals: {
      service_name: service,
  }, ignore: true
end

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  config[:host] = 'https://freedomainzones.netlify.app'
  config[:disqus] = true

  activate :minify_css
  activate :minify_javascript
end
