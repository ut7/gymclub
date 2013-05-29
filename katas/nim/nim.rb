DEFAULT_LENGTH = 20

def rand_value(index)
  rand([index + 1, 3].min) + 1
end

def generate_program(length = DEFAULT_LENGTH)
  Array.new(length) { |i| rand_value i }
end

def winner(program1, program2)
  length = program1.length
  round = program1
  loop do
    length -= round[length - 1]
    return round if length <= 0

    round = (round == program1 ? program2 : program1)
  end
end

def score(programs, program)
  programs.reduce(0) do |total, opponent|
    winner(program, opponent) == program ? total + 1 : total
  end
end

def winners(programs)
  programs.sort_by { |program| score(programs, program) }.reverse.take(programs.length / 2)
end

def breed(programs)
  programs + programs.map do |program|
    (program.take(program.length / 2) + programs.sample[program.length / 2..-1]).tap do |program|
      5.times do
        i = rand(program.length)
        program[i] = rand_value i
      end
    end
  end
end

if ARGV.length < 2
  puts "./nim.rb population rounds"
  exit
end

programs = Array.new(ARGV[0].to_i) { generate_program }

ARGV[1].to_i.times do
  programs = breed(winners(programs))
end

(0...programs[0].length).each do |i|
  str = "#{i + 1}:"
  programs.each do |program|
    str += " #{program[i]}"
  end
  puts str
end
