require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

get '/' do
  "Hello World!"
end

get '/bookmark' do
 @bookmarks = Bookmark.all
 p Bookmark.all
  erb(:index)
end

get '/bookmark/new' do
  erb(:new)
end

post '/bookmark' do
  url = params['url']
 Bookmark.create(params['url'])
   # connection = PG.connect(dbname: 'bookmark_manager_test')
   # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
redirect '/bookmark'
end

run! if app_file == $0
end
