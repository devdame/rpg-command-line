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
    return view.goodbye if name == "quit" || name == "exit"
  	self.hero = Character.create(name: name, location_id: 1)
    view.lets_begin(hero.name)
    answer = gets.chomp
    return view.goodbye if answer == "quit" || answer == "exit"
    if answer.downcase.include?("no") || answer.downcase == "n"
      return view.seeya_coward(name)
    else
      view.hell_yeah(name)
      get_prompt
    	game_loop
    end
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
    check_first_word
  end

  def check_first_word
    case split_input[0]
    when "help", "menu", "options"
      self.prompt = help
    when "go", "walk", "move"
      direction_parser(split_input[1])
    when "north", "n", "south", "s", "east", "e", "west", "w", "up", "u", "d", "down"
      direction_parser(split_input[0])
    when "quit", "exit"
      return "quit"
    when "inventory"
      self.prompt = hero.get_inventory
    when "look"
      self.prompt = location.description_with_items
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


  # case input
  #   if "unlock chest"
  #     if you're in the room with the chest
  #       and you're holding the key
  #       use key on chest


  # case input
  #   # unlock chest with purple key
  #   # open door with hatchet
  #   # put amulet on statue
  #   # drop crystal into pool

  #   action # unlock
  #   sending_object # key
  #   receiving_object # chest

  #   if receiving_object = room.find_receiving_object
  #     receiving_object.use(action, sending_object)
  #   end
  # end


  # hit chest with key
  # chest.use(hit, key)

  # chest
  # @useable_by: [key: ["unlock", "open"], wand: ["wave", "open"]]

  # number of uses?



  def direction_parser(word)
    if (word == "north" or word == "n") and hero.location.north_room
        hero.location = hero.location.north_room
    elsif (word == "south" or word == "s") and hero.location.south_room
        hero.location = hero.location.south_room
    elsif (word == "east" or word == "e") and hero.location.east_room
        hero.location = hero.location.east_room
    elsif (word == "west" or word == "w") and hero.location.west_room
        hero.location = hero.location.west_room
    elsif (word == "up" or word == "u") and hero.location.up_room
        hero.location = hero.location.up_room
    elsif (word == "down" or word == "d") and hero.location.down_room
        hero.location = hero.location.down_room
    else
      invalid_direction
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

  def invalid_direction
    self.prompt = "Looks like you can't go that way."
  end


  def invalid_input
    self.prompt = "I'm sorry, I didn't understand you."
  end

  def get_prompt
    if prompt
      view.prompt(prompt)
      self.prompt = nil
    else
      get_location
      current_prompt = location.description_with_items
      view.prompt(current_prompt)
    end
  end

  def get_possible_input
    possible_actions = []
  	location.items.each do |item|
  		possible_input << item.possible_actions
  	end
    hero.items.each do |item|
      possible_input << item.possible_actions
    end
  	possible_input.flatten
  end

  def get_location
  	self.location = hero.location
  end

  def help
    <<-STRING

Okay, adventurer. Time to go over some of the basic commands.

************************ MOVEMENT ************************

go, walk, move ------------------------- move on, BUT.....
        ***  MUST BE FOLLOWED BY A DIRECTION:  **
north, n ------------------------------- walk to the north
south, s ------------------------------- walk to the south
east, e -------------------------------- walk to the east
west, w -------------------------------- walk to the west

************************ GAMEPLAY ************************

look ----------------------------------- look at your surroundings
inventory ------------------------------ lists your inventory

********************** BORING STUFF **********************

quit, exit ----------------------------- quit the game
help, menu, options -------------------- show these directions

STRING
  end


end
