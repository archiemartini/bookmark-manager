require 'bookmark_list'

describe BookmarkList do

  subject(:subject) { described_class.new([
    "http://www.makersacademy.com",
    "http://www.destroyallsoftware.com",
    "http://www.google.com"
   ])}

  describe '#all' do
    it 'lists the bookmarks saved in the bookmarks list' do
      expect(subject.all).to eq([
        "http://www.makersacademy.com",
        "http://www.destroyallsoftware.com",
        "http://www.google.com"
       ])
    end
  end
end
