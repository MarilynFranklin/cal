require './calendar'
if ARGV.length == 2
  month = ARGV[0]
  year = ARGV[1]
  puts generate_calendar_for(month, year)

elsif ARGV.length == 1
  year = ARGV[0]
  puts generate_calendar_full_year(year)
end

# argv.length