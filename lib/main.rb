require_relative 'display'
require_relative 'input_checker'
require_relative 'profile'
require 'yaml'

class Game
    attr_accessor :current_profile
    include Display
    include Checker

    def initialize
        reset_save unless File.exists?('save_file.yaml') 
        savefile = YAML.load_file('save_file.yaml')
        display_intro(
            savefile["profile1"],
            savefile["profile2"],
            savefile["profile3"]
        )
        p selected_profile = chk_selected_profile(savefile)
        case selected_profile
        when "1"
            profile_key = "profile1"
        when "2"
            profile_key = "profile2"
        when "3"
            profile_key = "profile3"
        when "reset"
        end
        @current_profile = GameProfile.new(savefile["#{profile_key}"], savefile, profile_key)
        new_profile if current_profile.profile_name == "-New Profile-"
        game_start
    end
    def game_start
        reset_game if current_profile.current_word == ''
        display_guess_start(current_profile)
        game_loop
    end
    def game_loop
        if current_profile.turns_left == 0
            current_profile.loses += 1
            display_player_lose(current_profile)
            gets
            current_profile.current_word = ''
            game_start
        end
        guess = chk_guess
        current_profile.turns_left -= 1
        case guess[0]
        when 'letter'
            match = chk_letter(guess[1])
            display_letter_guess(current_profile, guess[1], match)
            game_loop
        when 'word'
            display_incorrect_guess(current_profile, guess[1])
            game_loop
        when 'win'
            current_profile.wins += 1
            display_player_win(current_profile)
            gets
            current_profile.current_word = ''
            game_start
        end
    end
    def reset_game
        current_profile.turns_left = 8
        current_profile.current_word = ''
        generate_word
        hidden_word
        current_profile.update_save
    end
    def hidden_word
        current_profile.hidden_word = 
        current_profile.current_word.chars.map {
            |letter| letter = "_"
        }.join(' ')
    end
    def new_profile
        display_new_profile
        current_profile.profile_name = chk_profile_name
    end
    def generate_word
        line = rand(1..9894)
        result = nil
      
        File.open('word_bank.txt', "r") do |f|
            while line > 0
                line -= 1
                result = f.gets
            end
        end
      
        if result.chomp.length > 4 and result.chomp.length < 13
            current_profile.current_word = result.chomp
        else
            generate_word
        end
    end
    def reset_save
        profile = {
            "profile1"=>{
                "profile_name"=>"-New Profile-",
                "wins"=>0,
                "loses"=>0,
                "current_word"=>"",
                "hidden_word"=>"",
                "turns_left"=>8
                },
            "profile2"=>{
                "profile_name"=>"-New Profile-",
                "wins"=>0,
                "loses"=>0,
                "current_word"=>"",
                "hidden_word"=>"",
                "turns_left"=>8
                },
            "profile3"=>{
                "profile_name"=>"-New Profile-",
                "wins"=>0,
                "loses"=>0,
                "current_word"=>"",
                "hidden_word"=>"",
                "turns_left"=>8
                }
            }
        
        update = YAML.dump(profile)
        save_file = File.open('save_file.yaml', "w")
        save_file.puts update
        save_file.close
    end
end

new_game = Game.new


