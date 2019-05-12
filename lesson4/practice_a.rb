flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p flintstones.each_with_object({}) { |elem, hash| hash[elem] = flintstones.index(elem) }


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.inject(:+)


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.reject { |name, age| age >= 100 }


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.sort.first



flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.find { |name| name[0..1] == "Be" }


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p flintstones.map { |name| name.slice!(0,3) }
p flintstones.map { |name| name[0..2] }


statement = "The Flintstones Rock"
def count(str)
  hash = Hash.new(0)
  str.split('').each { |letter| hash[letter] += 1 }
  hash
end
p count(statement)


words = "the flintstones rock"
def titleize(str)
  str.split(' ').map { |word| word.capitalize }.join(' ')
end
p titleize(words)


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
def ages(hash)
  hash.each do |name, _|
    hash[name]['age_group'] = if hash[name]['age'] < 18
                              'kid'
                            elsif hash[name]['age'] >= 18 &&
                                  hash[name]['age'] < 65
                              'adult'
                            else
                              'senior'
                            end
  end
end

p ages(munsters)  