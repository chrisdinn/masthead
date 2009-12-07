Before('@checkpoint') do
  require 'rack/test'
  @browser = Rack::Test::Session.new(Rack::MockSession.new(ActionController::Dispatcher.new))
end