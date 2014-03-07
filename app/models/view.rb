class View

  def initialize
  end

  def greet_user
    puts "WELCOME TO GAME"
  end

  def ask_for_name
    puts "\nWhat should I call you?"
  end

  def lets_begin(name)
    puts "\nOkay, #{name}!  Let's begin.\n\nThis game finds you on an uncomfortably dark and boring night, which, in a fit of ennui, you have decided to make less boring but much more dark.  There's a looming, decrepit victorian mansion on the outskirts of town that you have always assumed to be abandoned, but on a recent drive you noticed that there was a light on in the attic.  You don't quite understand your own impulses, but something about that light caught your imagination, and you drove out to the property to see if you can explore the place.  You have exited your car and are standing in front of the tall, ornate front door, which is slightly ajar.  It doesn't seem like anyone is home.  Do you dare go in?\n"
  end

  def hell_yeah(name)
    puts "\nHell yeah you do!  Way to adventure, #{name}.  You push the door open and the rusty hinges shriek out into the darkness.  As you enter the house, the door slams shut behind you.  You try to open it, but it's locked..."
  end

  def prompt(current_prompt)
    puts "\n#{current_prompt}"
  end

  def goodbye
    puts "\nOkay, see you next time!"
  end

  def seeya_coward(name)
    puts "\nBefore you enter the door, you have an epiphany--you're a total turd.  You get in your turd car and go home.  Looks like there's no adventure in your life, #{name}.  Looks like there's only SHAME."
  end
	
end