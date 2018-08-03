  require_relative 'router'
  CIRCLE_OF_FIFTHS = ["C", "G", "D", "A", "E", "B", "Gb", "Db", "Ab", "Eb", "Bb", "F"]

  MODES = {
    1 => "Ionian",
    2 => "Mixylodian",
    3 => "Dorian ",
    4 => "Aeolian",
    5 => "Phrygian",
    6 => "Locrian",
    12 => "Lydian",
  }

  def reorder_scale(note)
    scale = ["C", "G", "D", "A", "E", "B", "Gb", "Db", "Ab", "Eb", "Bb", "F"]
    while scale[0] != note
      scale.insert(0, scale.pop)
    end
    return scale
  end

  def find_harp_key(song_key, position)
    scale = reorder_scale(song_key)
    return scale[-(position.to_i - 1)]
  end

  def find_song_key(harp_key, position)
    scale = reorder_scale(harp_key)
    return scale[position - 1]
  end

  def find_position(song_key, harp_key)
    scale = reorder_scale(harp_key)
    return  scale.find_index(song_key) + 1
  end



