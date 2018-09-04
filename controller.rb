require_relative 'view'

class Controller

  def initialize
    @view = View.new
  end

  def song
    harmonica_key = @view.ask_user("What's the key of the harmonica?")
    position =  @view.ask_user("In which position do you fancy playing it?")
    song_key =  find_song_key(harmonica_key, position.to_i)
    @view.ask_user("The song is in the key of #{song_key}.")
  end

  def position
    harmonica_key = @view.ask_user("What's the key of the harmonica?")
    song_key = @view.ask_user("What's the key of the song?")
    position = find_position(song_key, harmonica_key)
    @view.ask_user("The song is played in #{position} position.")
  end

  def harmonica
    song_key = @view.ask_user("What's the key of the song?")
    position =  @view.ask_user("In which position do you fancy playing it?")
    harmonica_key = find_harp_key(song_key, position)
    @view.ask_user("You'll be playing a #{harmonica_key} harmonica.")
  end

  def draw
    harmonica_key = @view.ask_user("What's the key of the harmonica?")
    layout = harmonica_drawer(harmonica_key)
    @view.build(layout)
  end

  def guess
    harmonica_key = ["C", "G", "D", "A", "E", "B", "Gb", "Db", "Ab", "Eb","Bb", "F"].sample
    harmonica_hole = ["-10", "-9", "-8", "-7", "-6", "-5", "-4", "-3",
                      "-2", "-1", "0", "1", "2", "3", "4", "5", "6",
                      "7", "8", "9", "10", "-1'", "-2'", "-2''", "-3'",
                      "-3''", "-3'''", "-4'", "-6'", "7'", "8'", "9'", "10'" ].sample
    holes_hash = harmonica_hash_drawer(harmonica_key)
    answer = @view.ask_user("What's the note on the #{harmonica_hole} of a #{harmonica_key} harmonica?")
    if answer == holes_hash[harmonica_hole]
      puts "Well done!"
    else
      puts "Better luck next time."
    end
  end

end
