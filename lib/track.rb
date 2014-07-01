require 'artist'

class Track
  attr_accessor :title, :version, :artists, :karaoke

  def initialize(options)
    {
      karaoke: false,
      artists: []
    }.merge(options).each do |k,v|
      self.send("#{k}=", v)
    end
  end

  def title_and_version
    if version.to_s == ''
      title
    else
      "#{title} (#{version})"
    end
  end

  def has_various_artists?
    artists.any? do |artist|
      artist.name =~ /various(.?)artist/i
    end
  end

  def karaoke?
    !!@karaoke
  end
end
