require 'test/unit'
require 'calendar'

class CalTest < Test::Unit::TestCase

  def test_01_find_month_code
    assert_equal 13, get_month_code(1)
  end
  def test_01b_find_month_code
    assert_equal 6, get_month_code(6)
  end
  def test_01c_month_name_is_correct
    assert_equal "February", get_month_name(2)
  end
  def test_01d_month_name_is_correct
    assert_equal "March", get_month_name(3)
  end

  def test_04_month_start_day
    assert_equal 0, get_month_start_day(12, 2012)
  end
  def test_04b_month_start_day
    assert_equal 0, get_month_start_day(13, 1999)
  end

  def test_04c_month_start_day
    assert_equal 0, get_month_start_day(9, 2012)
  end  

  def test_04d_month_start_day
    assert_equal 4, get_month_start_day(14, 2011)
  end 

  def test_04e_month_start_day
    assert_equal 4, get_month_start_day(8, 2012)
  end

  def test_04f_month_start_day
    assert_equal 0, get_month_start_day(5, 1999)
  end
  def test_05_leap_year
    assert_equal true, leap_year?(2012)
  end

  def test_05b_leap_year
    assert_equal true, leap_year?(2000)
  end

  def test_05c_leap_year
    assert_equal false, leap_year?(1900)
  end

  def test_05d_leap_year
    assert_equal false, leap_year?(1993)
  end

  def test_06_number_of_days_in_month
    assert_equal 29, get_num_days_in_month(2, 2012)
  end
  def test_07_number_of_days_in_month
    assert_equal 31, get_num_days_in_month(12, 2012)
  end

  def test_10_calendar_month_array_correct_num_days
    assert_equal [" ", " ", " ", " ", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", " ", " ", " ", " ", " ", " ", " "], generate_month(31, 5)
  end
  def test_11_calendar_month_array_correct_num_days
    month = generate_month(31, 5)
    assert_equal ["             1  2  3", " 4  5  6  7  8  9 10", "11 12 13 14 15 16 17", "18 19 20 21 22 23 24", "25 26 27 28 29 30 31", "                    "], month_pretty(month)
  end

  def test_14_calendar_month_array_correct_num_days
    assert_equal  "     March 1999     \nSu Mo Tu We Th Fr Sa\n    1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30 31         \n                    \n", generate_calendar_for(3, 1999)
  end
end
