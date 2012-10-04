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
    jan_to_mar, apr_to_jun = compile_three_months(0), compile_three_months(3)
    jul_to_sep, oct_to_dec = compile_three_months(6), compile_three_months(9)
    three_column_year = jan_to_mar + apr_to_jun + jul_to_sep + oct_to_dec
  end

  def compile_three_months(month_index)
    three_months_grouped, temp, week_index = [], [], 0
    while week_index <= LAST_WEEK_INDEX do
      complete_year[month_index..month_index + 2].each{ |line| temp << line[week_index]}
      week_index += 1
    end
    temp.each_slice(3) { |value| three_months_grouped << value.join }
    three_months_grouped
  end

  def print_year
    year = title
    three_column_year_array.collect{|line| line + "\n" }.each_slice(8){|line| year += line.join + "\n" }
    year.chop
  end

end