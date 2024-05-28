def buy_fruit(list)
  list.flat_map { |fruit, quantity| [fruit] * quantity }
end
