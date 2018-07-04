require 'pg'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
       connection = PG.connect(dbname: 'bookmark_manager_test')
       connection.exec("INSERT INTO bookmarks (url) VALUES('http://makersacademy.com')")
       connection.exec("INSERT INTO bookmarks (url) VALUES('http://amazon.co.uk')")
       connection.exec("INSERT INTO bookmarks (url) VALUES('http://google.com')")

      bookmarks = Bookmark.all


      expect(bookmarks).to include "http://makersacademy.com"
      expect(bookmarks).to include "http://amazon.co.uk"
      expect(bookmarks).to include "http://google.com"
    end
  end
end
