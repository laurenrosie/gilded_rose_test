require 'coveralls'
Coveralls.wear!

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
# replace following line with SimpleCov.start to get coverage stats locally
SimpleCov.start do
  add_filter 'spec'
end
# run `open coverage/index.html` from the command line to view details

require 'rspec'
require './lib/gilded_rose'
require './lib/item'
