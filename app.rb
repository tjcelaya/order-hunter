require 'rubygems'
require 'haml'
require 'sinatra'
require 'digest'
require 'stylus'
require 'stylus/tilt'
require './setup'

get '/' do
  @orders = Order.all
  haml :main 
end

post '/add-order' do
  if params[:'item-name'] == ""
    redirect '/'
  end

  @o = Order.create(
    :oitem => params[:'item-name'],
    :ovendor => params[:'item-vendor'],
    :opurpose => params[:'item-purpose']
  )
  
  puts "SAVED =" + @o.saved?.to_s
  @o.errors.each do |error|  
      puts error
  end
  redirect '/'
end

get '*' do
  '<h1 style="margin: 30%">:(404):</h1>'
end

__END__

@@ hamltemplate
