lib_master = File.expand_path('../gobble/tobi', __FILE__)
$LOAD_PATH.unshift(lib_master) unless $LOAD_PATH.include?(lib_master)
require 'gobble/tobi/parser'

Gobble::Tobi::Parser.new.parse
