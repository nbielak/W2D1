# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError 
  return nil 
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  # elsif maybe_fruit == "coffee"
    # retry
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
rescue StandardError
  puts "That's not a fruit! Feed me coffee to try again."
  retry if gets.chomp == "coffee"
end  


class YearsError < StandardError
  puts "You aren't best friends yet!"
end 

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise ArgumentError if name.length == 0
    @yrs_known = yrs_known
    raise YearsError if yrs_known < 5
    @fav_pastime = fav_pastime
    raise ArgumentError if fav_pastime.length == 0

  end
  


  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


