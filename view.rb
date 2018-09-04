class View

  def ask_user(question)
    puts "#{question}"
    print "> "
    return gets.chomp.capitalize
  end

  def build(something)
    puts something
  end

end
