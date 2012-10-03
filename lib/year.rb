require './lib/month'

class Year
  attr_reader :year 

  def initialize(year)
  	@year = year
  end

  def title
    "#{@year}".rjust(YEAR_HALF_LINE_LENGTH) + "\n"
  end

  def month_array(month_num)
  	month = Month.new(month_num, @year)
    whole_month = [month.simple_title, WEEK_DAYS] + month.generate_weeks_array
  end

  def complete_year
    complete_year = Array.new
    i = 1
    while i <= LAST_MONTH do 
      complete_year << month_array(i)
      i += 1
    end
    complete_year
  end

  def three_column_year_array
    pretty_year = Array.new
    i = 1
    year_index = 0
    month_index = 0
    new_line = ""
    while i <= LAST_LINE_OF_TWELFTH_MONTH do 
      line = complete_year[year_index][month_index]
      if i == LAST_LINE_OF_THIRD_MONTH  || i == LAST_LINE_OF_SIXTH_MONTH || i == LAST_LINE_OF_NINTH_MONTH
        pretty_year << new_line + line 
        new_line = ""
        year_index += 1
        month_index = 0
      elsif i % EVERY_THIRD_LINE == 0
        pretty_year << new_line + line
        new_line = ""
        year_index -= 2
        month_index += 1
      else
        new_line = new_line + line
        year_index += 1
      end
      i += 1
    end
    pretty_year
  end

  def print_year
    last_line = three_column_year_array.length
    year = title
    i = 1
    three_column_year_array.each do |line|
      if i % 8 == 0
        year = year + line + "\n" 
        year = year + "\n" if i != last_line
      else
        year = year + line + "\n"
      end
      i += 1
    end
    year
  end

end