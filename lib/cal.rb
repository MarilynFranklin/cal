require './calendar'
if ARGV.length == 2
  month_string = ARGV[0]
  year_string = ARGV[1]
  month = month_string.to_i
  year = year_string.to_i
  if year_string.match(/\D/)
  	puts "#{year_string} is not a valid year."
  elsif month_string.match(/\D/) || month < 1 || month > 12
  	puts "Please enter a valid numerical month (ex: enter 1 for January, or 12 for December)."
  elsif year < 1800 || year > 3000
  	puts "Sorry, cal only works for dates from year 1800 through year 3000."
  else
    puts generate_calendar_for(month, year)
  end
elsif ARGV.length == 1
  year_string = ARGV[0]
  year = year_string.to_i
  if year_string.match(/\D/)
  	puts "#{year_string} is not a valid year."
  elsif year < 1800 || year > 3000
  	puts "Sorry, cal only works for dates from year 1800 through year 3000."
  else
    puts generate_calendar_full_year(year)
  end
end
