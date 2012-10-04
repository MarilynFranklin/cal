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
    EACH_MONTH.times { |i| complete_year << month_array(i += 1) }
    complete_year
  end

  def three_column_year_array
    jan_to_mar = compile_three_months(0)
    apr_to_jun = compile_three_months(3)
    jul_to_sep = compile_three_months(6)
    oct_to_dec = compile_three_months(9)
    three_column_year = jan_to_mar + apr_to_jun + jul_to_sep + oct_to_dec
  end

  def compile_three_months(month_index)
    three_months_grouped = []
    i = 1
    week_index = 0
    new_line = ""
    while i <= LAST_LINE_OF_THIRD_MONTH do 
      line = complete_year[month_index][week_index]     
      if i % EVERY_THIRD_LINE == 0
        three_months_grouped << new_line + line
        new_line = ""
        month_index -= 2
        week_index += 1
      else
        new_line = new_line + line
        month_index += 1
      end
      i += 1
    end
    three_months_grouped
  end

  def print_year
    year = title
    three_column_year_array.collect{|line| line + "\n" }.each_slice(8){|line| year += line.join + "\n" }
    year.chop
  end

end