def greetings(names, job_info)
  full_name = names.join(' ')
  job = job_info.values.join(' ')
  article = 'aeiou'.include?(job[0].downcase) ? 'an' : 'a'
  "Hello, #{full_name}! Nice to have #{article} #{job} around."
end
