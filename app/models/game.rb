class Game < ActiveRecord::Base
  has_one :hero, class_name: :Character
	attr_accessor :view, :input, :prompt, :location, :hero, :split_input
  after_create :setup_game

	def setup_game
		@view = View.new
		@input = nil
		@location = nil
		@hero = nil
    @prompt = nil
    @split_input = nil
	end

  def run!
  	view.greet_user
  	view.ask_for_name
  	name = gets.chomp
  	self.hero = Character.create(name: name, location_id: 1)
    view.lets_begin(hero.name)
    get_prompt
  	game_loop
  end

  def game_loop
  	self.input = gets.chomp.downcase
  	return view.goodbye if parse_input == "quit"
    get_prompt
    game_loop
  end

  def parse_input
  	# possible_input = get_possible_input
    self.split_input = input.split(' ')
    # invalid_input unless possible_input.include?(split_input[0])
    check_input_word
  end

  def check_input_word
    case split_input[0]
    when "help", "menu"
      self.prompt = help
    when "go", "walk", "move"
      direction_parser(split_input[1])
    when "north", "n", "south", "s", "east", "e", "west", "w", "up", "down"
      direction_parser(split_input[0])
    when "quit", "exit"
      return "quit"
    # when "inventory"
    #   self.prompt = hero.get_inventory
    # when "take", "grab"
    #   take(split_input.drop(1).join(' '))
    # when "pick"
    #   if split_input[1] == "up"
    #     take(split_input.drop(2).join(' '))
    #   else
    #     invalid_input
    #   end
    # when "drop", "discard"
    #   take(split_input.drop(1).join(' '))
    # when "put"
    #   if split_input[1] == "down"
    #     take(split_input.drop(2).join(' '))
    #   else
    #     invalid_input
    #   end
    else
      invalid_input
    end
  end

  def direction_parser(word)
    case word
    when "north", "n"
      if hero.location.north_room
        hero.location = hero.location.north_room
      else
        invalid_input
      end
    when "south", "s"
      if hero.location.south_room
        hero.location = hero.location.south_room
      else
        invalid_input
      end
    when "east", "e"
      if hero.location.east_room
        hero.location = hero.location.east_room
      else
        invalid_input
      end
    when "west", "w"
      if hero.location.west_room
        hero.location = hero.location.west_room
      else
        invalid_input
      end
    when "up"
      if hero.location.up_room
        hero.location = hero.location.up_room
      else
        invalid_input
      end
    when "down"
      if hero.location.down_room
        hero.location = hero.location.down_room
      else
        invalid_input
      end
    else
      invalid_input
    end
  end

  # def take(item)
  #   item_names = location.items.map {|item| item.name.comparify}
  #   if item_names.include?(item.comparify)
  #     Item.find_by_name(item).possessable = hero
  #   else
  #     invalid_input
  #   end
  # end

  # def drop(item)

  # end


  def invalid_input
    self.prompt = "I'm sorry, I didn't understand you."
  end

  def get_prompt
    if prompt
      view.prompt(prompt)
      self.prompt = nil
    else
      get_location
      current_prompt = location.description
      view.prompt(current_prompt)
    end
  end

  # def get_possible_input
  # 	possible_input = ["help", "menu", "inventory", "quit", "exit", "wait", "listen", "look", "look around", "go", "walk", "move"]
  # 	# location.items.each do |item|
  # 	# 	possible_input << item.possible_actions
  # 	# end
  #   # hero.inventory.each do |item|
  #   #   possible_input << item.possible_actions
  #   # end
  # 	possible_input.flatten
  # end

  def get_location
  	self.location = hero.location
  end

  def help
    <<-STRING

Okay, adventurer. Time to go over some of the basic commands.

************************ MOVEMENT ************************

go, walk, move (direction) ------------- 
north, n ------------------------------- walk to the north
south, s ------------------------------- walk to the south
east, e -------------------------------- walk to the east
west, w -------------------------------- walk to the west

************************ GAMEPLAY ************************

look
listen
wait
inventory

********************** BORING STUFF **********************

quit, exit ----------------------------- quit the game
help, menu ----------------------------- show these directions

STRING
  end


end

game = Game.create
game.run!
