VALID_INSTRUCTIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

def error(type)
  case type
  when :stack then puts 'error: stack empty'
  when :nil_reg then puts 'error: nil register'
  when :zero then puts 'error: div or mod by zero'
  when :invalid then puts 'error: invalid instruction'
  end
end

def ml(com)
  stack = []
  register = 0
  error = nil
  com.split(' ').each do |inst|
    case inst
    when 'PUSH'  then stack.push(register)
    when 'ADD'  
      break error(:stack) if stack.empty? 
      register += stack.pop
    when 'SUB'
      break error(:nil_reg) if register.nil?
      break error(:stack) if stack.empty?
      register -= stack.pop
    when 'MULT'
      break error(:nil_reg) if register.nil?
      break error(:stack) if stack.empty?      
      register *= stack.pop
    when 'DIV'   
      break error(:nil_reg) if register.nil?
      break error(:stack) if stack.empty? 
      test = stack.pop.to_f
      break error(:zero) if test.zero?
      register /= test
    when 'MOD'
      break error(:nil_reg) if register.nil?
      break error(:stack) if stack.empty? 
      test = stack.pop.to_f
      break error(:zero) if test.zero?
      register %= test
    when 'POP'
      break error(:stack) if stack.empty?
      register = stack.pop
    when 'PRINT'
      break error(:nil_reg) if register.nil?
      puts register
    else
      if !VALID_INSTRUCTIONS.include?(inst) && inst != inst.to_i.to_s
        break error(:invalid)
      end
      register = inst.to_i
    end
  end
end

ml('5 PUSH PRINT')
ml('5 PUSH 3 MULT PRINT')
ml('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT STUFF PUSH')   
ml('-3 PUSH 5 SUB PRINT')