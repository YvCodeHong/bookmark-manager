require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

get '/' do
  "Hello World!"
end

get '/bookmark' do
 @bookmarks = Bookmark.all
  erb(:index)
end

get '/bookmark/new' do
  erb(:bookmarks)
end

post '/bookmark' do
 Bookmark.create(params[:url])
 redirect '/bookmark'
end

# post '/bookmarks' do
#   url = params['url']
#   connection = PG.connect(dbname: 'bookmark_manager_test')
#   connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
#   redirect '/bookmarks'
# end

run! if app_file == $0
end
