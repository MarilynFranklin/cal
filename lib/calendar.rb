SAT = 0
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
  pretty_month = Array.new
  month_code = MONTHS[month][:zellers_month]
  z_year = get_zellers_year(month, year)
  month_name = MONTHS[month][:name]
  month_and_year = "#{month_name} #{year}".center(20)
  days_of_the_week = "Su Mo Tu We Th Fr Sa"
  pretty_month[0, 2] = [month_and_year, days_of_the_week]
  month_start_day = get_month_start_day(month_code, z_year)
  num_days_in_month = MONTHS[month][:days_in_month]
  num_days_in_month += 1 if month_name == "February" && leap_year?(year)
  month_array = generate_month(num_days_in_month, month_start_day)
  pretty_month = pretty_month + month_pretty(month_array)
  print_month(pretty_month)
end
def print_month(month_array)
  month = ""
  month_array.each do |line|
    month = month + line + "\n"
  end
  month
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
  four_hundred_years = 400
  one_hundred_years = 100
  four_years = 4
  if (year % four_hundred_years) == 0
    true
  elsif (year % one_hundred_years) == 0
    false
  elsif (year % four_years) == 0
    true
  else
    false
  end 
end
# ========= print full year implementation ========== #
def generate_calendar_full_year(year)
  complete_year_array = complete_year(year)
  pretty_year = year_pretty(complete_year_array)
  print_year(pretty_year, year)
end
def generate_month_without_year_in_title(month, year)
  month_calendar_width = 20
  pretty_month = Array.new
  month_code = MONTHS[month][:zellers_month]
  z_year = get_zellers_year(month, year)
  month_name = MONTHS[month][:name]
  month_title = "#{month_name}".center(month_calendar_width)
  days_of_the_week = "Su Mo Tu We Th Fr Sa"
  pretty_month[0, 2] = [month_title, days_of_the_week]
  month_start_day = get_month_start_day(month_code, z_year)
  num_days_in_month = MONTHS[month][:days_in_month]
  num_days_in_month += 1 if month_name == "February" && leap_year?(year)
  month_array = generate_month(num_days_in_month, month_start_day)
  pretty_month = pretty_month + month_pretty(month_array)
end
def complete_year(year)
  last_month = 12
  complete_year = Array.new
  i = 1
  while i <= last_month do 
    complete_year << generate_month_without_year_in_title(i, year)
    i += 1
  end
  complete_year
end
def year_pretty(complete_year_array)
  last_line_of_third_month = 24
  last_line_of_sixth_month = 48
  last_line_of_ninth_month = 72
  last_line_of_twelfth_month = 96
  pretty_year = Array.new
  i = 1
  year_index = 0
  month_index = 0
  new_line = ""
  while i <= last_line_of_twelfth_month do 
    line = complete_year_array[year_index][month_index]
    if i == last_line_of_third_month  || i == last_line_of_sixth_month || i == last_line_of_ninth_month
      new_line = new_line + line
      pretty_year << new_line
      new_line = ""
      year_index += 1
      month_index = 0
    elsif i % 3 == 0
      new_line = new_line + line
      pretty_year << new_line
      new_line = ""
      year_index -= 2
      month_index += 1
    else
      new_line = new_line + line + "  "
      year_index += 1
    end
    i += 1
  end
  pretty_year
end
def print_year(pretty_year_array, year)
  full_line_length = 64
  year = "#{year}".center(full_line_length) + "\n"
  extra_line = " " * full_line_length + "\n"
  year = year
  i = 1
  pretty_year_array.each do |line|
    if i % 8 == 0
      year = year + line + "\n" + extra_line
    else
      year = year + line + "\n"
    end
    i += 1
  end
  year
end