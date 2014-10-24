require 'sinatra'
require 'time'

class Sinny < Sinatra::Base

  get '/' do
    @result=eval(params[:code])
    "Results from Ruby command: "
    erb :results

 
  end
  after do
    headers({ 'X-Frame-Options' => 'ALLOW' })
  end
end
