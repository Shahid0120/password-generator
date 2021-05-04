=begin
    Password genarator 
    by Shahid Hussain 
    decription :
        The program will ask do you want to create a password or see strength of existing one?
        for (create)
            options
                lenght
                    4
                    8
                    10
        for (existing)
            gives strength level 
            and how to improve strength level 


        methods i want to use in this project
        1. Hash table
        2. Classes 
        3 get code small as possible
        4. ternary interatorys
        5. Condition assignment
        6. One-liners

=end 
require "tty-prompt"
prompt = TTY::Prompt.new
class NewPassword
    attr_accessor :length, :strength

    def initialize(length, strength)
        @length = length
        @strength = strength
    end

    def length_password
        puts "how long do you want the new password to be?"
    end

    def strength_password
        puts "what level of strength are you looking for? (weak, intermediate or strong)"
    end

    def password_generator 
        # generates letters, numbers and symbols arrays
        lower_letters = []
        upper_letters = []
        nums = []
        symbols = []
        ("a".."z").each { |letter|
            lower_letters << letter 
        } 
        ("A".."Z").each { |letter|
            upper_letters << letter 
        } 
        #("0".."9").each { |num|
        #    nums << num
        #}
        # found easier way to do it in one loop instead of two loops
        ("!".."?").each { |symbol|
            # symbols range includes 0 to 9 which we dont want
            if symbol == "0" or symbol == "1" or symbol == "2" or symbol == "3" or symbol == "4" or symbol == "5" or symbol == "6" or symbol == "7" or symbol == "8" or symbol == "9"
                nums << symbol
            else 
                symbols << symbol
            end
        }
        new_password = ''
        new_length = length.to_i
        # word generator
            # weak 
                # letters and numbers only!
                # letters followed by numbers 
                # based on the lenght they want its is split event
                # odd then more letters then numbers 
            # intermediate
                # contains letters then followed by numbers, then follwoed by symbols
                # based on lenghts again devied by 3  

            # strong
                # contains letters, numbs and symbols
                # they all come from random order
        if strength[0]
            # creates division between the  how many letters and numbers
            #wasnt working before now it
            if new_length % 2 == 0
                #even 
                letter_half = new_length / 2
                number_half = new_length / 2
            else 
                #odd 
                # 1 more letter then number
                new_length = new_length + 1
                letter_half = new_length / 2
                number_half = (new_length / 2) - 1
            end
            while letter_half > 0
                # randommise letter chosend from letters[]
                new_password = new_password + lower_letters.sample
                letter_half = letter_half - 1
            end
            while number_half > 0
                #random numbers chossen from nums[]
                new_password = new_password + nums.sample
                number_half = number_half - 1
            end
        elsif strength[1]
            # has lower case, upper case, numebrs then 1 symbol
            # minus 1 for the symbol , as it is constant
            # so division between 2 half of it is number and letters (inside letter divsion between 2 numbers and letters)
            if (new_length - 1) % 2 == 0 
                # even after symbol 
                letter_half = (new_length - 1)/ 2
                upper_letter_quater = (letter_half / 2) + 1
                lower_letters_quater = letter_half / 2
                number_half = (new_length - 1) / 2
            else
                # odd 
                letter_half = new_length / 2
                upper_letter_quater = (letter_half / 2)+ 1
                lower_letters_quater = letter_half / 2
                number_half = (new_length/ 2) - 1
            end
            while upper_letter_quater > 0 
                new_password = new_password + upper_letters.sample
                upper_letter_quater = upper_letter_quater - 1
            end
            while lower_letters_quater > 0 
                new_password = new_password + lower_letters.sample
                lower_letters_quater = lower_letters_quater - 1
            end
            while number_half > 0
                #random numbers chossen from nums[]
                new_password = new_password + nums.sample
                number_half = number_half - 1
            end
            new_password = new_password + symbols.sample
        elsif strength[2]
            # strong
            # strong is a random combination of letters, numbers, symbs and uppercase 
            # array allows a random slector of combination picker, alowing randmisation combination of symbols, letters and numbers
            random_number_array = ["1", "2", "3", "4"]
            while new_length > 0
                x = random_number_array.sample
                if x == "1"
                    new_password = new_password + upper_letters.sample
                elsif x == "2"
                    new_password = new_password + lower_letters.sample
                elsif x == "3"
                    new_password = new_password + nums.sample
                elsif x == "4"
                    new_password = new_password + symbols.sample
                end
                new_length = new_length - 1
            end
        end

        puts new_password
        
    end
              
end

class ExistingPassword
    attr_accessor :password

    def initialize(password)
        @password = password
    end

    def password_generator 
        #password_length_integer = password.length
        for char in password.to_s!
            if char == ("A"..."Z")
                upper_counter += 1
            elsif char == ("a"..."z")
                lower_counter += 1
            elsif charr == ("1"..."9")
                nums_counter += 1
            else 
                symbols_counter += 1
            end
        end
        if upper_counter >= 1 && lower_counter >= 1 && nums_counter >= 1 && symbols_counter >= 1
            puts "this password is strong"
        elsif upper_counter == 0 && symbols_counter == 0 
            puts "this password is weak"
        elsif symbols_counter <= 1 
            puts "this passowrd is intermediate"
        else 
            puts "cant compute"
        end
    end

end


    

puts "Hello! Welcome to the Code Reviewer/Generator 3000"
puts "Lets begin! What would you like to do?"
choices = %w(new_password existing_password)
question_choice = prompt.multi_select("What do you wanna do?", choices)
# puts "Do you want to genrator a password or see strength of existing password? (type in new or existing)"
# genarate_or_password = gets.chomp
# genarate_or_password.downcase!

# trying one linners 
#puts "Great Choice lets make a new password for you" if genarate_or_password == "new"
#puts "Greate chocie lets review your existing password" if genarate_or_password == "existing"


# keeps generating if genarate_or_password doenst == new or exsiting until it does
=begin 
# before ttyl-prompt
if genarate_or_password != "new" and genarate_or_password != "existing"
    puts "Bad Choice this is not a part of the options, lets try again!"
    until genarate_or_password == "new" or genarate_or_password == "existing"
        genarate_or_password = gets.chomp
        genarate_or_password.downcase!
    end
end
=end


# trying out teneray operators 
#puts genarate_or_password == "new" ? "Great Choice lets make a new password for you" : "Greate chocie lets review your existing password"
puts choices.inspect 

if choices[0]
    #genarate_or_password = NewPassword.new()
    #genarate_or_password.length_password
    puts "how long do you want the password to be?"
    # why did i use gets.chomp vs gets line 80 stregnth == "weak\n"
    genarate_or_password_legnth = prompt.slider("Password Length", min: 0, max: 30, step:5)
    #genarate_or_password.strength_password
    choices = %w(weak intermediate strong)
    genarate_or_password_strength = prompt.multi_select("What level of strength are you looking for?", choices)
    genarate_or_password = NewPassword.new(genarate_or_password_legnth,choices)
else choices[1]
    puts "Type in the password:"
    password = gets.chomp
    genarate_or_password = ExistingPassword.new(password)
end

puts "Your new password is:"
genarate_or_password.password_generator




    