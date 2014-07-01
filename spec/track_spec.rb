require 'track'

describe Track do
  describe '#initialize' do
    it 'should set all attributes using defaults' do
      track = Track.new(title: "Title", karaoke: true)
      expect(track.title).to eq "Title"
      expect(track).to be_karaoke
      expect(track.artists).to be_empty
    end
  end

  describe '#has_various_artists?' do
    context 'when having VARIOUSARTISTS in one of the artist names' do
      subject { Track.new(title: "Title", artists: [Artist.new("VARIOUS ARTISTS")]) }
      its(:has_various_artists?){ should be_true }
    end

    context 'when having VARIOUSARTISTS in not one of the artist names' do
      subject { Track.new(title: "Title", artists: [Artist.new("Artist Name")]) }
      its(:has_various_artists?){ should be_false }
    end
  end
end
