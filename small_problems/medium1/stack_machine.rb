def numbers_to_ints(op_list)
  op_list.map { |op| op.to_i.to_s == op ? op.to_i : op }
end

def valid?(op_list)
  valid_ops = %w(PUSH POP PRINT ADD SUB MULT DIV MOD)
  op_list.each do |op|
    return false unless valid_ops.include?(op) || op.class == Integer
  end
  true
end

def machine(ops)
  op_list = numbers_to_ints(ops.split)
  return puts 'invalid input' unless valid?(op_list)
  register = 0
  stack = []
  until op_list.empty?
    op = op_list.shift
    register = op if op.class == Integer
    stack.push(register) if op == 'PUSH'
    register += stack.pop if op == 'ADD'
    register -= stack.pop if op == 'SUB'
    register *= stack.pop if op == 'MULT'
    register /= stack.pop if op == 'DIV'
    register %= stack.pop if op == 'MOD'
    puts register if op == 'PRINT'
    register = stack.pop if op == 'POP' unless stack.empty?
  end
end

machine('5 PUSH 3 MULT PRINT')
machine('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
machine('-3 PUSH 5 SUB PRINT')
machine("PRINT")

#(3 + (4 * 5) - 7) / (5 % 3)
machine('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')
machine('5 PUSH 3 MULT PRINT STUFF')
machine('789.5 PRINT')
machine('PUTS 5')
machine('5 PUSH POP POP POP PRINT')