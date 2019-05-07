numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# prints
# 1
# 2
# 2
# 3
# because it didn't mutate the caller

=begin
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

what is != and where should you use it?
>> Use the 'not equals' sign to check if two boolean values are different.
put ! before something, like !user_name
>> For a boolean value it negates it. For a truthy value it returns false,
>> and for a falsey value returns true.
put ! after something, like words.uniq!
>> '!' for a suffix isn't a method or operator by itself; some methods happen to end with '!', though.
put ? before something
>> The only time this would make sense is a ternary operator: some_method ? true : false
put ? after something
>> It could be either a ternary operator or a method that returns a boolean.
put !! before something, like !!user_name
>> A double-negation leaves a boolean value unchanged, but changes a truthy value to true
>> and a falsy value to false.
=end

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub('important', 'urgent')

# for the array
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
# returns [1, 3, 4, 5] (deletes value at index 1)
numbers.delete(1)
# returns [2, 3, 4, 5] (deletes all copies of 1)

(10..100).cover?(42)

famous_words = "seven years ago..."
# "Four score and " << famous_words
# famous_words.prepend("Four score and ")


def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
# prints "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

eval(how_deep)
# returns 42

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones.flatten
# prints ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney")
# prints ["Barney", 2]