


    until op_list.empty?
      op = op_list.shift
      case
      when op.class == Integer then register = op
      when op == 'PUSH' then stack.push(register)
      when op == 'ADD'  then register += stack.pop
      when op == 'SUB'  then register -= stack.pop
      when op == 'MULT' then register *= stack.pop
      when op == 'DIV'  then register /= stack.pop
      when op == 'MOD'  then register %= stack.pop
      when op == 'POP'  then register = stack.pop unless stack.empty?
      when op == 'PRINT' then puts register
      end
    end