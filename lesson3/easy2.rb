ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.key?("Spot")
ages.include?("Spot")
ages.member?("Spot")
# all return false

munsters_description = "The Munsters are creepy in a good way."
# >> munsters_description.upcase.gsub("THE", 'tHE').gsub("MUNSTERS", 'mUNSTERS') 
# >> => "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

# >> munsters_description.capitalize
# >> => "The munsters are creepy in a good way."

# >> munsters_description.downcase
# >> => "the munsters are creepy in a good way."

# >> munsters_description.upcase
# >> => "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge(additional_ages)
# => { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino")

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# or flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino")
# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino"]
# or flintstones << "Dino" << "Hoppy"
# or flintstones.concat(%w(Dino Hoppy))
# or flintstones.push("Dino").push("Hoppy")
# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino", "Hoppy"]

advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice(advice.index("house")..-1)
# => "house training your pet dinosaur."

statement = "The Flintstones Rock!"
statement.count('t')
# => 2

title = "Flintstone Family Members"
spaces = (40 - title.length) / 2
# or title.center(40)
