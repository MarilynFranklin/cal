require './calendar'

if ARGV.length == 2
  month_string = ARGV[0].downcase
  year_string = ARGV[1]
  month = month_string.to_i
  year = year_string.to_i
  if year_string.match(/\D/)
  	puts "#{year_string} is not a valid year."
  elsif month_string.match(/\D/)
    if month_string.length < 3
      puts "#{month_string} is not a valid month" 
    else
      month_int = nil
      NEW_MONTHS.keys.each do |month|
        if month_string =~ /(#{Regexp.quote(month)})/
          month_int = NEW_MONTHS[$1]
        end
      end
      if month_int.nil?
        puts "#{month_string} is not a valid month."
      else
        puts generate_calendar_for(month_int, year)
      end
    end
  elsif month < 1 || month > 12
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
