

SATURDAY = 0
SUNDAY = 1
MONDAY = 2
TUESDAY = 3
WEDNESDAY = 4
THURSDAY = 5
FRIDAY = 6


JAN = 1
FEB = 2
MAR = 3
APR = 4
MAY = 5
JUN = 6
JUL = 7
AUG = 8
SEP = 9
OCT = 10
NOV = 11
DEC = 12


def generate_calendar_for(month, year)
  month = month.to_i
  year = year.to_i
  pretty_month = Array.new
  month_code = get_month_code(month)
  z_year = get_zellers_year(month, year)
  month_name = get_month_name(month)
  month_and_year = "#{month_name} #{year}".center(20)
  days_of_the_week = "Su Mo Tu We Th Fr Sa"
  pretty_month << month_and_year
  pretty_month << days_of_the_week
  month_start_day = get_month_start_day(month_code, z_year)
  num_days_in_month = get_num_days_in_month(month, year)
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

def get_month_code(month)
  month_code = month < 3 ? month + 12 : month
end
def get_zellers_year(month, year)
  zellers_year = month < 3 ? year - 1 : year
end

def get_month_name(month_code)
  case month_code
    when JAN
      "January"
    when FEB
      "February"
    when MAR
      "March"
    when APR
      "April"
    when MAY
      "May"
    when JUN
      "June"
    when JUL
      "July"
    when AUG
      "August"
    when SEP
      "September"
    when OCT
      "October"
    when NOV
      "November"
    when DEC
      "December"
  end
end

def get_num_days_in_month(month, year)
    case month
    when JAN
      31
    when FEB
      if leap_year?(year)
        29
      else
        28
      end
    when MAR
      31
    when APR
      30
    when MAY
      31
    when JUN
      6
    when JUL
      31
    when AUG
      31
    when SEP
      30
    when OCT
      31
    when NOV
      30
    when DEC
      31
  end
end
def generate_month(days_in_month, month_start_day)
  if month_start_day > 0
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
