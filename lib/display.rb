module Display
    def display_intro(profile1, profile2, profile3)
        puts"\n\n\n\n\n\n\n\n\n\n
        Welcome to Hangman Ruby!!!

        please select a profile

        1: #{profile1["profile_name"]}
        2: #{profile2["profile_name"]}
        3: #{profile3["profile_name"]}
        
        enter the profile number
        "
    end
    def display_selected_profile_error(profile1, profile2, profile3)
        puts"\n\n\n\n\n\n\n\n\n\n
        Welcome to Hangman Ruby!!!

        invalid selection

        1: #{profile1["profile_name"]}
        2: #{profile2["profile_name"]}
        3: #{profile3["profile_name"]}
        
        enter the profile number
        "
    end
    def display_new_profile
        puts"\n\n\n\n\n\n\n\n\n\n
        

        

        
        
        

        please enter name for new profile
        "
    end
    def display_new_profile_error
        puts"\n\n\n\n\n\n\n\n\n\n
        

        invalid profile name **must 5 to 12 characters

        
        
        

        please enter name for new profile
        "
    end
    def display_guess_start(current_profile)
        puts"\n\n\n\n\n\n\n\n\n\n
        player : #{current_profile.profile_name}
        wins: #{current_profile.wins}
        losses: #{current_profile.loses}

        guess the word or pick a letter
        turns left - #{current_profile.turns_left}
        
        #{current_profile.hidden_word}
        "
    end
    def display_invalid_guess(current_profile)
        puts"\n\n\n\n\n\n\n\n\n\n
        player : #{current_profile.profile_name}
        wins: #{current_profile.wins}
        losses: #{current_profile.loses}

        invalid input. try again
        turns left - #{current_profile.turns_left}
        
        #{current_profile.hidden_word}
        "
    end
    def display_incorrect_guess(current_profile, guess)
        puts"\n\n\n\n\n\n\n\n\n\n
        player : #{current_profile.profile_name}
        wins: #{current_profile.wins}
        losses: #{current_profile.loses}

        '#{guess}' is incorrect. try again
        turns left - #{current_profile.turns_left}
        
        #{current_profile.hidden_word}
        "
    end
    def display_letter_guess(current_profile, guess, match)
        puts"\n\n\n\n\n\n\n\n\n\n
        player : #{current_profile.profile_name}
        wins: #{current_profile.wins}
        losses: #{current_profile.loses}

        #{match} '#{guess}' matched
        turns left - #{current_profile.turns_left}
        
        #{current_profile.hidden_word}
        "
    end
    def display_player_win(current_profile)
        puts"\n\n\n\n\n\n\n\n\n\n
        player : #{current_profile.profile_name}
        wins: #{current_profile.wins}
        losses: #{current_profile.loses}

        
        you guessed #{current_profile.current_word}
        
        enter to reset 
        "
    end
    def display_player_lose(current_profile)
        puts"\n\n\n\n\n\n\n\n\n\n
        player : #{current_profile.profile_name}
        wins: #{current_profile.wins}
        losses: #{current_profile.loses}

        
        answer is #{current_profile.current_word}
        
        enter to reset 
        "
    end
end