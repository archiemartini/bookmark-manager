require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark_list.rb'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

get '/' do
  redirect '/bookmarks'
end

get '/bookmarks' do
  @bookmarks = BookmarkList.new([
    "http://www.makersacademy.com",
    "http://www.destroyallsoftware.com",
    "http://www.google.com"
   ]).all
  erb :index
end


run! if app_file == $0
end