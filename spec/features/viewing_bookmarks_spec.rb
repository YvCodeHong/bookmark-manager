feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: "bookmark_manager_test")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://makersacademy.com')")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://amazon.co.uk')")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://google.com')")
    visit('/bookmark')
    expect(page).to have_content 'http://google.com'
    expect(page).to have_content 'http://amazon.co.uk'
    expect(page).to have_content 'http://makersacademy.com'
  end
end
