class GameProfile
    attr_accessor :savefile, :selected_profile, :profile_name, :wins, :loses, :current_word, :hidden_word, :turns_left

    def initialize(profile, savefile, profile_key)
        @savefile = savefile
        @selected_profile = profile_key
        @profile_name = profile["profile_name"]
        @wins = profile["wins"]
        @loses = profile["loses"]
        @current_word = profile["current_word"]
        @hidden_word = profile["hidden_word"]
        @turns_left = profile["turns_left"]
    end
    
    def update_save
        loaded_save = YAML.load_file('save_file.yaml')
        loaded_save["#{selected_profile}"]["profile_name"] = profile_name
        loaded_save["#{selected_profile}"]["wins"] = wins
        loaded_save["#{selected_profile}"]["loses"] = loses
        loaded_save["#{selected_profile}"]["current_word"] = current_word
        loaded_save["#{selected_profile}"]["hidden_word"] = hidden_word
        loaded_save["#{selected_profile}"]["turns_left"] = turns_left
        loaded_save = YAML.dump(loaded_save)
        current_save = File.open('save_file.yaml', "w")
        current_save.puts loaded_save
        current_save.close
    end

end