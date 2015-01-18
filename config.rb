$LOAD_PATH << '.'

require 'lib/fredwina.rb'
require 'lib/parser.rb'
require 'lib/position.rb'
require 'lib/direction.rb'
require 'model/dog.rb'
require 'model/paddock.rb'
require 'pry'

ROOT = FileUtils.pwd