def lights(number)
  switches = Array.new(number + 1, 0)
  toggle!(switches)
  on_switches(switches)
end

def toggle!(switches)
  number_of_rounds = switches.size - 1
  (1..number_of_rounds).each_with_object(switches) do |round, switches|
    (round..number_of_rounds).step(round).each { |index| switches[index] += 1 }
  end
end

def on_switches(switches)
  switches.each_index.select { |index| switches[index].odd? }
end
