module Checker
    def chk_selected_profile(savefile)
        selected_profile = gets.chomp
        unless selected_profile == "1" || selected_profile == "2" || selected_profile == "3"
            display_selected_profile_error(
                savefile["profile1"],
                savefile["profile2"],
                savefile["profile3"]
            )
            chk_selected_profile(savefile)
        end
        selected_profile
    end
    def chk_profile_name
        profile_name = gets.chomp
        if profile_name.length > 4 and profile_name.length < 13
            profile_name
        else
            display_new_profile_error
            chk_profile_name
        end
    end
    def chk_guess
        guess = gets.chomp.downcase
        if guess !~ /[A-Za-z]/
            display_invalid_guess(current_profile)
            chk_guess
        elsif guess.length == 1
            ['letter', guess]
        elsif guess.length != current_profile.current_word.length
            display_invalid_guess(current_profile)
            chk_guess
        elsif guess == current_profile.current_word
            ['win', guess]
        else
            ['word', guess]
        end
    end
    def chk_letter(guess)
        cw = current_profile.current_word.chars
        hw_array = current_profile.hidden_word.split(' ')
        word_array = []
        hw_array.each_with_index do |letter, idx|
            p cw[idx]
            p letter
            letter = guess if guess == cw[idx] 
            p letter
            p word_array << letter
        end
        current_profile.hidden_word = word_array.join(' ')
        current_profile.current_word.chars.count(guess)
    end
end