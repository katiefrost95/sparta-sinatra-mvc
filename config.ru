require 'sinatra'
require "sinatra/reloader" if development? #development means if changes are made on local host true then run
require_relative './controllers/photos_controller.rb'

run PhotosController #putting reloader in photos controller
