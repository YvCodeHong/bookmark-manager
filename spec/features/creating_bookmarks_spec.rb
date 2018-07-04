feature "Adding a new bookmark" do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmark')
    click_button('Add link')
    fill_in("url", with:'http://testbookmark.com')
    click_button('Submit')

    expect(page).to have_content 'http://testbookmark.com'
  end
end
