 def reorder_scale(note)
  scale = ["C","Db","D","Eb","E","F","Gb","G","Ab","A","Bb","B"]
  while scale[0] != note
    scale.insert(0, scale.pop)
  end
  return scale
end

def find_key(position, scale)
  number = (position.to_i - 1) * 7
  halfsteps(number, scale)
end

def halfsteps(number, scale)
  i = 0
  distance = number.to_i
  scale.cycle do |element|
    if i == distance
      return element
    else
      if element != "B" || element != "E"
        i += 1
      else
        i += 2
      end
    end
  end
end




puts "Hi, which key of harmonica do you have?"
harmonica_key = gets.chomp
scale = reorder_scale(harmonica_key)
puts "And in position would you like to play?"
position = gets.chomp
song_key = find_key(position, scale)
puts "I guess you'll be playing in the key of #{song_key} then."
note =["C","Db","D","Eb","E","F","Gb","G","Ab","A","Bb","B"].sample
scale = reorder_scale(note)
position = (1..12).to_a.sample
key = find_key(position, scale)
puts "Okay, my turn.\n Which key of harmonica do you use to play a #{key} song in #{position} position?"
answer = gets.chomp
if answer == note
  puts "Oh wow. Keep harpin, sonny boy."
else
  puts "Haha, you reedless fool."
end

