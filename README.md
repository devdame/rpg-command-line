#A Text-Based RPG!

This is a console-based, active-record-backed simple text-based role playing game.  It was my first try at figuring out how to deal with modeling interactive fiction in a program, and it's still very much so a work in progress.  This later was re-vamped as [Dragon Blaster](https://github.com/nealcpeters/Dragon_Blaster_Pro), but I hope to return to this when I have some time and make it the awesome game it deserves to be!

##How to Set it Up:

1.  Clone the repo down to your machine: `git clone https://github.com/devdame/rpg-command-line.git command-line-rpg`
2.  Make sure your dependencies are all downloaded and up-to-date: `bundle install`
3.  Create and set up your databases: `rake db:create db:migrate`
4.  Fill those databases up with a delightful story!  `rake db:seed`
5.  Aw yiss, it's time to play!  Run this command to get started: `ruby game_runner.rb`
6.  Don't forget you can type `help` at any time during the game for further instructions!

