require 'sinatra'
require 'time'
require 'securerandom'
require 'haml'

class Sinny < Sinatra::Base
  enable :sessions
  set :session_secret, "My session secret"

  get '/' do
    x = eval params[:code].to_s
    render x
  end

end
