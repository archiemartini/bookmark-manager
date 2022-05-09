feature 'home page is accesible' do
  scenario 'home page returns successful status code' do
      visit('/')
      expect(page.status_code).to eq(200)
  end
end
