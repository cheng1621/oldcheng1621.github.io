<<<<<<< HEAD
source "https://rubygems.org"

gem "jekyll", ">= 3.8.6", "< 5.0"

# plugins
group :jekyll_plugins do
  gem "jekyll-paginate"
  gem "jekyll-redirect-from"
  gem "jekyll-seo-tag", "~> 2.6.1"
  gem "jekyll-archives"
end

group :test do
  gem "html-proofer", "~> 3.16.0"
=======
# frozen_string_literal: true

source "https://rubygems.org"

gemspec

group :test do
  gem "html-proofer", "~> 4.4"
>>>>>>> 3ed5eb1ee005122b798b001c352f1086e1901740
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
<<<<<<< HEAD
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
=======
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
>>>>>>> 3ed5eb1ee005122b798b001c352f1086e1901740
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
<<<<<<< HEAD
gem "wdm", "~> 0.1.1", :install_if => Gem.win_platform?
=======
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
>>>>>>> 3ed5eb1ee005122b798b001c352f1086e1901740
