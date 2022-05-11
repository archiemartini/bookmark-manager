feature 'home page is accesible' do
  scenario 'home page returns successful status code' do
      visit('/')
      expect(page.status_code).to eq(200)
  end
end

feature 'can view bookmarks through /bookmarks route' do
  scenario 'bookmarks appear at the bookmarks route' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    visit('/bookmarks')
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.makersacademy.com"
  end
end
