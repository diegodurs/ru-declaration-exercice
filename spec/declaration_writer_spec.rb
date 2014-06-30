require 'declaration_writer'

describe DeclarationWriter do
  describe '::declare' do
    let(:arguments){ {} } # what should be the arguments?

    let(:tracks) do
      tracks = []
      tracks << Track.new(title: 'Track 1', version: 'Version', karaoke: false, artists: [Artist.new('Artist 1')])
      tracks << Track.new(title: 'Track 2', version: 'Version', karaoke: true, artists: [Artist.new('Artist 2')])
      tracks << Track.new(title: 'Track 3', version: 'Version', karaoke: false, artists: [Artist.new('VARIOUS ARTISTS')])
      return tracks
    end

    subject(:results){ DeclarationWriter.declare(arguments) }

    it 'should return the header' do
      expect(results).to include ['Artists', 'Track Title and Version']
    end
    it 'should include valid track' do
      expect(results).to include ['Artist 1', 'Track 1 (Version)']
    end
    it 'should not include the karaoke tracks' do
      expect(results).to_not include ['Artist 2', 'Track 2 (Version)']
    end
    it 'should not include tracks with Various Artists' do
      expect(results).to_not include ['VARIOUS ARTISTS', 'Track 3 (Version)']
    end
  end
end
