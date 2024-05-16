def staggered_case(string, start_upper: true, count_all: true)
  uppercase = start_upper ? false : true
  string.chars.map do |char|
    next char if char =~ /[^a-z]/i unless count_all
    uppercase = !uppercase
    uppercase ? char.upcase : char.downcase
  end.join
end

string = 'T e s t i n g'
p staggered_case(string) == 'T E S T I N G'
p staggered_case(string, start_upper: false) == 't e s t i n g'
p staggered_case(string, count_all: false) == 'T e S t I n G'
p staggered_case(string, start_upper: false, count_all: false) == 't E s T i N g'
