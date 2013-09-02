# require 'rack'
require './models'

$PORT = ARGV[0] || 80

use Rack::Deflater
set :port, $PORT
set :haml, :ugly => true

Encoding.default_external = Encoding::UTF_8

enable :sessions

get '/style.css' do
  headers "Content-Type" => "text/css;"
  stylus :style
end
