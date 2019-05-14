hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

#result = hsh.each_with_object([]) do |entry, obj|
#  obj << entry[1][:colors].map { |color| color.capitalize } if entry[1][:type] == 'fruit'
#  obj << entry[1][:size].upcase if entry[1][:type] == 'vegetable'
#end
result = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end

p result