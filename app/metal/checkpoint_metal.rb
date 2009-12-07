# Allow the metal piece to run in isolation
#require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)
require 'sinatra/base'

class CheckpointMetal < Sinatra::Base
  disable :raise_errors
  helpers Checkpoint::Authentication
  use Checkpoint::Sessions::App 
end
