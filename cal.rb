require './lib/month'
require './lib/year'

def reassign_month_name_to_integer_value(month_string, year)
  month_int = nil
  MONTHS_ABBR.keys.each do |month|
    if month_string =~ /(#{Regexp.quote(month)})/
      month_int = MONTHS_ABBR[$1]
    end
  end
  if month_int.nil?
    puts "#{month_string} is not a valid month."
  else
    cal = Month.new(month_int, year)
    cal.print_month
  end
end


if ARGV.length == 2
  month_string = ARGV[0].downcase
  year_string = ARGV[1]
  month = month_string.to_i
  year = year_string.to_i
  if year_string.match(/\D/)
  	puts "#{year_string} is not a valid year."
  elsif month_string.match(/\D/)
    if month_string.length < 3
      puts "#{month_string} is neither a month number (1..12) nor a name" 
    else
      reassign_month_name_to_integer_value(month_string, year)
    end
  elsif month < 1 || month > 12
    puts "#{month}is neither a month number (1..12) nor a name"
  elsif year < 1800 || year > 3000
  	puts "Sorry, cal only works for dates from year 1800 through year 3000."
  else
    cal = Month.new(month, year)
    puts cal.print_month
  end
elsif ARGV.length == 1
  year_string = ARGV[0]
  year = year_string.to_i
  if year_string.match(/\D/)
  	puts "#{year_string} is not a valid year."
  elsif year < 1800 || year > 3000
  	puts "Sorry, cal only works for dates from year 1800 through year 3000."
  else
    cal = Year.new(year)
    puts cal.print_year
  end
end

