# frozen_string_literal: true

system('clear')

SQUARE_FEET_PER_SQUARE_METER = 10.7639
SQUARE_INCHES_PER_SQUARE_METER = 1_550.0031
SQUARE_CENTIMETERS_PER_SQUARE_METER = 10_000

SQUARE_METERS_PER_SQUARE_FOOT = 0.0929
SQUARE_INCHES_PER_SQUARE_FOOT = 144
SQUARE_CENTIMETERS_PER_SQUARE_FOOT = 929.0304

# keys in outer hash are starting unit; keys in inner hashes are target units
CONVERSIONS = {
  'square meters' => {
    'square feet' => SQUARE_FEET_PER_SQUARE_METER,
    'square inches' => SQUARE_INCHES_PER_SQUARE_METER,
    'square centimeters' => SQUARE_CENTIMETERS_PER_SQUARE_METER
  },
  'square feet' => {
    'square inches' => SQUARE_INCHES_PER_SQUARE_FOOT,
    'square centimeters' => SQUARE_CENTIMETERS_PER_SQUARE_FOOT,
    'square meters' => SQUARE_METERS_PER_SQUARE_FOOT
  }
}.freeze

def find_area(start_unit, target_units = [])
  dimensions = input_dimensions(start_unit)
  area = dimensions.inject(:*)
  display_area(area, start_unit)
  display_conversions(area, start_unit, target_units)
end

def input_dimensions(start_unit)
  base_unit = start_unit.split[1]
  %w[length width].map do |dimension|
    print "Enter the #{dimension} of the room in #{base_unit}: "
    gets.chomp.to_f
  end
end

def display_area(area, start_unit)
  puts "The area of the room is #{format_area(area)} #{start_unit}."
end

def format_area(area)
  format('%.2f', area).reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse
end

def display_conversions(area, start_unit, target_units)
  target_units.each do |target_unit|
    converter = CONVERSIONS[start_unit][target_unit]
    converted_area = area * converter
    puts "(#{format_area(converted_area)} #{target_unit})"
  end
end

# find_area('square meters', ['square feet'])
find_area('square feet', ['square inches', 'square centimeters'])
