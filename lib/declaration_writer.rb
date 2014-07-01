class DeclarationWriter

  def initialize(strategy)
    @strategy = strategy
  end

  def declare_tracks(tracks)
    [ # fake results to change with your implementation
      ['Artists', 'Track Title and Version'],
      row(tracks[0])
    ]
  end

  private
  def row(track)
    [
      track.artists.map(&:name).join(','),
      track.title_and_version
    ]
  end
end
