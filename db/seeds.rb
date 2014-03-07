def seed_actions
  Action.create(name: "north")
  Action.create(name: "south")
  Action.create(name: "east")
  Action.create(name: "west")
  Action.create(name: "up")
  Action.create(name: "down")
  Action.create(name: "take")
  Action.create(name: "drop")
end

def seed_maps
  Room.create(name: "foyer", description: "You are standing in the foyer of an old, dark mansion.  To the north is a locked door.  To the east and south are doors to other rooms in the house.  There is a set of stairs leading up to the second floor.", east_room_id: 2, south_room_id: 3, up_room_id: 4)
  Room.create(name: "kitchen", description: "You are standing in the kitchen.  Sharp knives glisten where they hang from the rack above the stove.  There is a strong smell of cooked meat and grease.  To the west is a door.", west_room_id: 1)
  Room.create(name: "ballroom", description: "You are standing in a large, eerily empty ballroom.  Its grandiosity is dampened by the cobwebs hanging from the chandeliers and the wallpaper peeling delicately above the mantle.  To the east and north are doors.", east_room_id: 5, north_room_id: 1)
  Room.create(name: "hallway", description: "You ascend the grand staircase to find yourself in a tight, constricted hallway.  There are three doors, all of which are locked.", down_room_id: 1)
  Room.create(name: "library", description: "You have entered a small, dark library.  Leather-bound books line the walls.  You notice that most of the books here are medical books, and very well-worn.  There is a door to the west, and a locked door to the south.", west_room_id: 3)
end

def seed_room_actions
  Room.all.each do |room|
    room.populate_actions
  end
end

def seed_items
  Item.create(name: "key", long_name: "tarnished brass key", description: "A tarnished brass key lies on the ground.", possessable_id: 1, possessable_type: :Room)
end

seed_actions
seed_maps
seed_room_actions
seed_items