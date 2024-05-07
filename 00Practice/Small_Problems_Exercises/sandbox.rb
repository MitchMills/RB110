munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  age_group = case info['age']
  when (0..17) then 'kid'
  when (18..64) then 'adult'
  else 'senior'
  end
  munsters[name]['age_group'] = age_group
end

p munsters

# a kid is in the age range 0 - 17,
# an adult is in the range 18 - 64 and
# a senior is aged 65+.
