feature 'home page is accesible' do
  scenario 'home page returns successful status code' do
      visit('/')
      expect(page.status_code).to eq(200)
  end
end

feature 'can view bookmarks through /bookmarks route' do
  scenario 'bookmarks appear at the bookmarks route' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.google.com"
  end
end
