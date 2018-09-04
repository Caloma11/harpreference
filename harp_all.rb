  # Interval formulas   for the most used scales

  SCALES_INTERVALS = {

  :major_scale => [2, 2, 1, 2, 2, 2, 1],
  :natural_minor_scale => [2, 1, 2, 2, 1, 2, 2],
  :minor_pentatonic_scale => [2, 2, 3, 2, 3],
  :blues_scale => [3, 2, 1, 1, 3, 2],
  :harmonic_minor_scale => [2, 1, 2, 2, 1, 3, 2],
  :melodic_minor_scale => [2, 1, 2, 2, 2, 2, 1],
  :ionian_scale => [2, 2, 1, 2, 2, 2, 1],
  :dorian_scale =>[2, 1, 2, 2, 2, 1, 2],
  :phrygian_scale => [1, 2, 2, 2, 1, 2, 2],
  :lydian_scale => [2, 2, 2, 1, 2, 2, 1],
  :mixolydian_scale => [2, 2, 1, 2, 2, 1, 2],
  :aeolian_scale => [2, 1, 2, 2, 1, 2, 2],
  :locrian_scale => [1, 2, 2, 1, 2, 2, 2],
  :whole_tone_scale => [2, 2, 2, 2, 2, 2],
  :whole_tone_diminished => [2, 1, 2, 1, 2, 1, 2, 1],
  :whole_half_diminished => [1, 2, 1, 2, 1, 2, 1, 2]
  }


  # Reorders a given scale so that it starts with a given note

  def reorder_any_scale(scale, note)
    while scale[0] != note
      scale.insert(0, scale.pop)
    end
    return scale
  end

  # Reorders scale

  def circle_scale(key)
      scale = ["C", "G", "D", "A", "E", "B", "Gb", "Db", "Ab", "Eb","Bb", "F"]
      while scale[0] != key
      scale.insert(0, scale.pop)
    end
    return scale
  end


  # Finds the harmonica key for a given song key and a given harmonica "position"

  def find_harp_key(song_key, position)
    scale = circle_scale(song_key)
    return scale[-(position.to_i - 1)]
  end


  # Finds the song key for a given harmonica key and a given harmonica "position"

  def find_song_key(harp_key, position)
    scale = circle_scale(harp_key)
    return scale[position - 1]
  end


  # Finds the harmonica "position" for a given harmonica key and a given song key

  def find_position(song_key, harp_key)
    scale = circle_scale(harp_key)
    return  scale.find_index(song_key) + 1
  end


  # Returns any scale in any given key, given that key and the intervals, which
  # are available in the SCALES_INTERVALS constant

  def scale_halfsteps(note, intervals)
  scale = ["C","Db","D","Eb","E","F","Gb","G","Ab","A","Bb","B"]
  i = 0
  scale = reorder_any_scale(scale, note)
  array = [scale[0]]

  intervals.each do |number|
    i += number
    array << scale[i]
  end
  array.pop
  array << array[0]
  return array
end

# Draws the layout of a harmonica in any key on the console

def harmonica_drawer(key)

  major_scale = scale_halfsteps(key, SCALES_INTERVALS[:major_scale])
  chromatic_scale = reorder_any_scale(["C","Db","D","Eb","E","F","Gb","G","Ab","A","Bb","B"], key)

  bend_blow_intervals = ["-", "-", "-", "-", "-", "-", "-", 3, 6, 11].map { |interval| (interval == "-" ? interval : chromatic_scale[interval]) }

  blow_notes_intervals = [1, 3, 5, 1, 3, 5, 1, 3, 5, 1].map { |interval| major_scale[interval - 1] }
  draw_notes_intervals = [2, 5, 7, 2, 4, 6, 7, 2, 4, 6].map { |interval| major_scale[interval - 1] }

  bend_draw_intervals = [1, 6, 10, 1, "-", 8, "-", "-", "-", "-"].map { |interval| (interval == "-" ? interval : chromatic_scale[interval]) }
  w_bend_draw_intervals = ["-", 5, 9, "-", "-", "-", "-", "-", "-", "-"].map { |interval| (interval == "-" ? interval : chromatic_scale[interval]) }
  wh_bend_draw_intervals = ["-", "-", 8, "-", "-", "-", "-", "-", "-", "-", "-"].map { |interval| (interval == "-" ? interval : chromatic_scale[interval]) }

  harmonarray = [bend_blow_intervals, blow_notes_intervals, draw_notes_intervals,
  bend_draw_intervals, w_bend_draw_intervals, wh_bend_draw_intervals]

  stringarr = []
  harmonarray.each do |array|

    stringarr << array.join(" ")
  end

  return stringarr
end

# puts harmonica_drawer('Eb')




# C harmonica layout








#                   Db F  Ab Db

# C  E  G  C  E  G  C  E  G  C

# D  G  B  D  F  A  B  D  F  A

# Db Gb Bb Db    Ab

#    F  A

#       Ab





