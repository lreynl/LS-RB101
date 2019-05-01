name = 'Bob'
save_name = name #both labels point to the same thing
name = 'Alice'   #name is reassigned and points to different memory
puts name, save_name



name = 'Bob'
save_name = name #both labels point to the same thing
name.upcase!     #'mutates the caller' - they still point to the same thing
puts name, save_name
