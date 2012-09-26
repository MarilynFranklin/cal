require './calendar'


month = ARGV[0]
year = ARGV[1]

puts generate_calendar_for(month, year)

# argv.length