require './lib/constants'

class Month
  attr_reader :month, :year, :month_name

  def initialize(month, year)
    @month = month
    @year = year
    @month_name = MONTHS[month][:name]
  end

  def title
    title = "#{@month_name} #{year}".center(20) + "  \n"
  end

  def simple_title
    "#{@month_name}".center(20) + "  "
  end

  def month_start_day
    # Calculations for finding the day of the week that a givens months begins on 
    # Implemented using Zeller's Congruence http://en.wikipedia.org/wiki/Zeller%27s_congruence
    month_code = MONTHS[@month][:zellers_month]
    year_of_century = (zellers_year % ONE_HUNDRED_YEARS).floor
    century = (zellers_year / ONE_HUNDRED_YEARS).floor
    day_of_week = (century/FOUR_YEARS).floor + (5 * century) + year_of_century 
    day_of_week += (year_of_century/FOUR_YEARS).floor + (((month_code + 1) * 26) / 10.0).floor + FIRST_DAY
    day_of_week = day_of_week.modulo(7)
  end

  def zellers_year
    # In zeller's congruence, January and February are calculated using the previous year
    # Implemented using Zeller's Congruence http://en.wikipedia.org/wiki/Zeller%27s_congruence
    zellers_year = @month < 3 ? @year - 1 : @year
  end

  def num_days_in_month
    num_days_in_month = MONTHS[month][:days_in_month]
    num_days_in_month += 1 if @month_name == "February" && leap_year?
    num_days_in_month
  end

  def leap_year?
    # leap years are either divisible by 400 or by 4
    # years that are divisible by 100 are not leap years
    # http://en.wikipedia.org/wiki/Leap_year
    if (@year % FOUR_HUNDRED_YEARS) == 0 
      true
    elsif (@year % ONE_HUNDRED_YEARS) == 0
      false
    elsif (@year % FOUR_YEARS) == 0
      true
    else
      false
    end 
  end

  def days_and_spaces_array
    month_start_day > SAT ? leading_spaces = [" "] * (month_start_day - 1) : leading_spaces = [" "] * 6
    month = leading_spaces + ("1".."#{num_days_in_month}").to_a
    trailing_spaces = [" "] * (FIRST_MONTH_ARRAY_SIZE - month.size) 
    month = month + trailing_spaces
  end

  def generate_weeks_array
    weeks_array = Array.new
    i = 1
    line = ""
    days_and_spaces_array.each do |n|
      if i % 7 == 0
        line += n.rjust(2) + "  "
        weeks_array << line
        line = ""
      else
        line += n.center(3)
      end
      i += 1
    end
    weeks_array
  end

  def print_month
    month = title + WEEK_DAYS + "\n"
    generate_weeks_array.each do |line|
      month += line + "\n"
    end
    month
  end
end