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
end
