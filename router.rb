class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "####### WELCOME TO THE ULTIMATE POKEMON GAME!! #######"

    while @running
      display_options
      option = gets.chomp.to_i
      puts `clear`
      route_action(option)
    end
  end

  def display_options
    puts ""
    puts "1 - Create Trainer"
    puts "2 - List a Trainer's team"
    puts "3 - Begin the Battle!!"
    puts "4 - Quit (and lose everything)"
  end

  def route_action(action)
    case action
    when 1 then @controller.create_player
    when 2 then @controller.list_player_team
    when 3 then @controller.begin_battle
    when 4 then stop
    else
      puts "Please choose a valid option!"
    end
  end

  def stop
    @running = false
  end
end
