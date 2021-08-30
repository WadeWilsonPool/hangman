class Hangman

    def initialize
        @word = words.sample
        @lives = 10
        @word_teaser = ""

        @word.first.size.times do
            @word_teaser += "_ "
        end
    end

    def words
        [
            ["cricket", "Pinocchio's sidekick"],
            ["jobbing", "Faster than walking"],
            ["party", "A gathering"],
            ["dog", "Not a cat"],
        ]
    end

    def print_teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
    end

    def update_teaser last_guess
        new_teaser = @word_teaser.split

        new_teaser.each_with_index do |letter, index|

            if letter == '__' && @word.first[index] == last_guess
                new_teaser[index] = last_guess
            end
        end

        @word_teaser = new_teaser.join(' ')
    end

    def make_guess
        if @lives > 0
            puts "Enter a letter:"
            guess = gets.chomp

            good_guess = @word.first.include? guess

            if guess == "exit"
                puts "Thank you for playing!"
                    make_guess

            elsif guess.length > 1
                puts "Only one letter please!"
                    make_guess

            elsif good_guess
                puts "Good guess!"

                print_teaser guess

                if @word.first == @word_teaser.split.join
                    puts "Congratulations.. you won!"
                else
                    make_guess
                end
            else 
                @lives -= 1
                puts "No dice! #{ @lives } lives left, try again!"
                make_guess
            end
            else
                puts "Game over man!"
            end
    end

    def begin
        puts "New game started! Good luck!" + " Your word is #{ @word.first.size } characters long"
        puts "To exit game type 'exit'"
        print_teaser

        puts "Clue: #{ word.last }"

        make_guess
    end
        
end

game = Hangman.new
game.begin