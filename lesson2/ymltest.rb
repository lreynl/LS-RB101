require 'yaml'
LIST = YAML.load_file('test.yaml')
p LIST

puts LIST['first']