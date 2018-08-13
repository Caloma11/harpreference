class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

def run
    puts "Hey there, harmonicist!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.song
    when 2 then @controller.position
    when 3 then @controller.harmonica
    when 4 then @controller.draw
    when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want know?"
    puts "1 - Song key when a harmonica is played in a given position"
    puts "2 - Position to play when you have one harmonica and know the song key"
    puts "3 - Harmonica key, for when you know the song key and the position in which it's played"
    puts "4 - Draw a harmonica in any key"
    puts "5 - Stop and exit the program"
  end
end
