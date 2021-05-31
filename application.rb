require_relative 'handler'
require_relative 'timeformatter'

class Application
  def call(env)
    @request = Rack::Request.new(env)
    return time_response if @request.path_info == '/time/'
    response(404, 'Not found')
  end

  private

  def response(status, text)
    Rack::Response.new(status, text).finish
  end

  def time_response
    time = Handler.new(@request.params)
    response(time.status, time.response)
  end
end
