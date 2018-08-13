class View

  def ask_user(question)
    puts "#{question}"
    print "> "
    return gets.chomp
  end

  def build(something)
    puts something
  end

end
