require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/request'

def log_request
  env = request.env
	@model = Request.new(
    uri: env['REQUEST_URI'],
    method: env['REQUEST_METHOD'],
    form_hash: env['rack.request.form_hash'],
    form_vars: env['rack.request.form_vars'],
    raw: env.inspect
  )
	@model.save
end

get '*' do
  log_request
  200
end

post '*' do
  log_request
  200
end

after do
  ActiveRecord::Base.connection.close
end
