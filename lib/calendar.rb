SAT = 0
# create hash for constants
MONTHS = {
  1 => {
    :name => "January", 
    :zellers_month => 13, 
    :days_in_month => 31
  }, 
  2 => {
    :name => "February", 
    :zellers_month => 14, 
    :days_in_month => 28
  }, 
  3 => {
    :name => "March", 
    :zellers_month => 3,
    :days_in_month => 31
  },
  4 => {
    :name => "April",
    :zellers_month => 4,
    :days_in_month => 30
  },
  5 => {
    :name => "May",
    :zellers_month => 5,
    :days_in_month => 31
  },
  6 => {
    :name => "June",
    :zellers_month => 6,
    :days_in_month => 30
  },
  7 => {
    :name => "July",
    :zellers_month => 7,
    :days_in_month => 31
  },
  8 => {
    :name => "August",
    :zellers_month => 8,
    :days_in_month => 31
  },
  9 => {
    :name => "September",
    :zellers_month => 9,
    :days_in_month => 30
  },
  10 => {
    :name => "October",
    :zellers_month => 10,
    :days_in_month => 31
  },
  11 => {
    :name => "November",
    :zellers_month => 11,
    :days_in_month => 30
  },
  12 => {
    :name => "December",
    :zellers_month => 12,
    :days_in_month => 31
  }

}

def generate_calendar_for(month, year)
  month = month.to_i
  year = year.to_i
  pretty_month = Array.new
  month_code = MONTHS[month][:zellers_month]
  z_year = get_zellers_year(month, year)
  month_name = MONTHS[month][:name]
  month_and_year = "#{month_name} #{year}".center(20)
  days_of_the_week = "Su Mo Tu We Th Fr Sa"
  pretty_month << month_and_year
  pretty_month << days_of_the_week
  month_start_day = get_month_start_day(month_code, z_year)
  num_days_in_month = MONTHS[month][:days_in_month]
  num_days_in_month += 1 if month_name == "February" && leap_year?(year)
  month_array = generate_month(num_days_in_month, month_start_day)
  pretty_month = pretty_month + month_pretty(month_array)
  print_month(pretty_month)
end
def print_month(month_array)
  result = ""
  month_array.each do |line|
    result = result + line + "\n"
  end
  result
end
def get_month_start_day(month, year)
  day = 1
  year_of_century = (year % 100).floor
  century = (year / 100.0).floor
  day_of_week = (century/4.0).floor + (5 * century) + year_of_century + (year_of_century/4).floor + (((month + 1) * 26) / 10.0).floor + day
  day_of_week = day_of_week.modulo(7)
end
def get_zellers_year(month, year)
  zellers_year = month < 3 ? year - 1 : year
end
def generate_month(days_in_month, month_start_day)
  if month_start_day > SAT
    spaces_before = [" "] * (month_start_day - 1)
  else
    spaces_before = [" "] * 6
  end
  month = ("1".."#{days_in_month}").to_a
  month = spaces_before + month
  final_array_size = 42
  spaces_after = [" "] * (final_array_size - month.size) 
  month = month + spaces_after
end
def month_pretty(month_array)
  pretty_month = Array.new
  i = 1
  line = ""
  month_array.each do |n|
    if i % 7 == 0
      line += n.rjust(2)
      pretty_month << line
      line = ""
    else
      line += n.center(3)
    end
    i += 1
  end
  pretty_month
end
def leap_year?(year)
  if (year % 400) == 0
    true
  elsif (year % 100) == 0
    false
  elsif (year % 4) == 0
    true
  else
    false
  end 
end
