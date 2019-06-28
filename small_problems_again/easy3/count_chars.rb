def string
  print 'Enter one or more words: '
  gets.chomp
end

def count(str)
  chars = str.split('').select { |chr| chr != ' ' }
  puts "There are #{chars.length} characters in \"#{str}\"."
end

count(string)