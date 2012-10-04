require 'test/unit'
require 'month'
require 'year'

class CalTest < Test::Unit::TestCase

  def test_01_find_month_code
    assert_equal 13, MONTHS[1][:zellers_month]
  end
  def test_01b_find_month_code
    assert_equal 6, MONTHS[6][:zellers_month]
  end
  def test_01c_month_name_is_correct
    assert_equal "February", MONTHS[2][:name]
  end
  def test_01d_month_name_is_correct
    assert_equal "March", MONTHS[3][:name]
  end

  def test_04_month_start_day
    cal = Month.new(12, 2012)
    assert_equal 0, cal.month_start_day
  end
  def test_04b_month_start_day
    cal = Month.new(1, 2000)
    assert_equal 0, cal.month_start_day
  end

  def test_04c_month_start_day
    cal = Month.new(9, 2012)
    assert_equal 0, cal.month_start_day
  end  

  def test_04d_month_start_day
    cal = Month.new(2, 2012)
    assert_equal 4, cal.month_start_day
  end 

  def test_04e_month_start_day
    cal = Month.new(8, 2012)
    assert_equal 4, cal.month_start_day
  end

  def test_04f_month_start_day
    cal = Month.new(5, 1999)
    assert_equal 0, cal.month_start_day
  end
  def test_05_leap_year
    cal = Month.new(5, 2012)
    assert_equal true, cal.leap_year?
  end

  def test_05b_leap_year
    cal = Month.new(2, 2000)
    assert_equal true, cal.leap_year?
  end

  def test_05c_leap_year
    cal = Month.new(4, 1900)
    assert_equal false, cal.leap_year?
  end

  def test_05d_leap_year
    cal = Month.new(2, 1993)
    assert_equal false, cal.leap_year?
  end

  def test_07_number_of_days_in_month
    assert_equal 31, MONTHS[12][:days_in_month]
  end

  def test_10_days_and_spaces_array_has_correct_spaces_before_and_after
    cal = Month.new(5, 1993)
    assert_equal [" ", " ", " ", " ", " ", " ", "1", "2", "3",
                 "4", "5", "6", "7", "8", "9", "10", 
                 "11", "12", "13", "14", "15", "16",
                 "17", "18", "19", "20", "21", "22", 
                 "23", "24", "25", "26", "27", "28", 
                 "29", "30", "31", " ", " ", " ", " ", " "], cal.days_and_spaces_array
  end
  def test_11_weeks_array_is_correct
    cal = Month.new(6, 2000)
    assert_equal ["             1  2  3  ",
                  " 4  5  6  7  8  9 10  ",
                  "11 12 13 14 15 16 17  ",
                  "18 19 20 21 22 23 24  ",
                  "25 26 27 28 29 30     ",
                  "                      "], cal.generate_weeks_array
  end

  def test_14_calendar_month_array_correct_num_days
    cal = Month.new(3, 1999)
    assert_equal  """     March 1999       
Su Mo Tu We Th Fr Sa  
    1  2  3  4  5  6  
 7  8  9 10 11 12 13  
14 15 16 17 18 19 20  
21 22 23 24 25 26 27  
28 29 30 31           
                      
""", cal.print_month
  end
  def test_15_calendar_month_array_correct_num_days
    cal = Year.new(1886)
    assert_equal  ["        July          ",
                   "Su Mo Tu We Th Fr Sa  ",
                   "             1  2  3  ",
                   " 4  5  6  7  8  9 10  ",
                   "11 12 13 14 15 16 17  ",
                   "18 19 20 21 22 23 24  ",
                   "25 26 27 28 29 30 31  ",
                   "                      "], cal.month_array(7)
  end
  def test_16_complete_year_returns_array_of_month_arrays
    cal = Year.new(1886)
    assert_equal  [["      January         ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "                1  2  ",
                    " 3  4  5  6  7  8  9  ",
                    "10 11 12 13 14 15 16  ",
                    "17 18 19 20 21 22 23  ",
                    "24 25 26 27 28 29 30  ",
                    "31                    "],
                   ["      February        ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "    1  2  3  4  5  6  ",
                    " 7  8  9 10 11 12 13  ",
                    "14 15 16 17 18 19 20  ",
                    "21 22 23 24 25 26 27  ",
                    "28                    ",
                    "                      "],
                   ["       March          ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "    1  2  3  4  5  6  ",
                    " 7  8  9 10 11 12 13  ",
                    "14 15 16 17 18 19 20  ",
                    "21 22 23 24 25 26 27  ",
                    "28 29 30 31           ",
                    "                      "],
                   ["       April          ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "             1  2  3  ",
                    " 4  5  6  7  8  9 10  ",
                    "11 12 13 14 15 16 17  ",
                    "18 19 20 21 22 23 24  ",
                    "25 26 27 28 29 30     ",
                    "                      "],
                   ["        May           ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "                   1  ",
                    " 2  3  4  5  6  7  8  ",
                    " 9 10 11 12 13 14 15  ",
                    "16 17 18 19 20 21 22  ",
                    "23 24 25 26 27 28 29  ",
                    "30 31                 "],
                   ["        June          ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "       1  2  3  4  5  ",
                    " 6  7  8  9 10 11 12  ",
                    "13 14 15 16 17 18 19  ",
                    "20 21 22 23 24 25 26  ",
                    "27 28 29 30           ",
                    "                      "],
                   ["        July          ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "             1  2  3  ",
                    " 4  5  6  7  8  9 10  ",
                    "11 12 13 14 15 16 17  ",
                    "18 19 20 21 22 23 24  ",
                    "25 26 27 28 29 30 31  ",
                    "                      "],
                   ["       August         ",
                    "Su Mo Tu We Th Fr Sa  ",
                    " 1  2  3  4  5  6  7  ",
                    " 8  9 10 11 12 13 14  ",
                    "15 16 17 18 19 20 21  ",
                    "22 23 24 25 26 27 28  ",
                    "29 30 31              ",
                    "                      "],
                   ["     September        ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "          1  2  3  4  ",
                    " 5  6  7  8  9 10 11  ",
                    "12 13 14 15 16 17 18  ",
                    "19 20 21 22 23 24 25  ",
                    "26 27 28 29 30        ",
                    "                      "],
                   ["      October         ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "                1  2  ",
                    " 3  4  5  6  7  8  9  ",
                    "10 11 12 13 14 15 16  ",
                    "17 18 19 20 21 22 23  ",
                    "24 25 26 27 28 29 30  ",
                    "31                    "],
                   ["      November        ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "    1  2  3  4  5  6  ",
                    " 7  8  9 10 11 12 13  ",
                    "14 15 16 17 18 19 20  ",
                    "21 22 23 24 25 26 27  ",
                    "28 29 30              ",
                    "                      "],
                   ["      December        ",
                    "Su Mo Tu We Th Fr Sa  ",
                    "          1  2  3  4  ",
                    " 5  6  7  8  9 10 11  ",
                    "12 13 14 15 16 17 18  ",
                    "19 20 21 22 23 24 25  ",
                    "26 27 28 29 30 31     ",
                    "                      "]], cal.complete_year
  end

  def test_17_three_column_array_is_correct
    cal = Year.new(1886)
    assert_equal  ["      January               February               March          ",
                   "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  ",
                   "                1  2      1  2  3  4  5  6      1  2  3  4  5  6  ",
                   " 3  4  5  6  7  8  9   7  8  9 10 11 12 13   7  8  9 10 11 12 13  ",
                   "10 11 12 13 14 15 16  14 15 16 17 18 19 20  14 15 16 17 18 19 20  ",
                   "17 18 19 20 21 22 23  21 22 23 24 25 26 27  21 22 23 24 25 26 27  ",
                   "24 25 26 27 28 29 30  28                    28 29 30 31           ",
                   "31                                                                ",
                   "       April                  May                   June          ",
                   "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  ",
                   "             1  2  3                     1         1  2  3  4  5  ",
                   " 4  5  6  7  8  9 10   2  3  4  5  6  7  8   6  7  8  9 10 11 12  ",
                   "11 12 13 14 15 16 17   9 10 11 12 13 14 15  13 14 15 16 17 18 19  ",
                   "18 19 20 21 22 23 24  16 17 18 19 20 21 22  20 21 22 23 24 25 26  ",
                   "25 26 27 28 29 30     23 24 25 26 27 28 29  27 28 29 30           ",
                   "                      30 31                                       ",
                   "        July                 August              September        ",
                   "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  ",
                   "             1  2  3   1  2  3  4  5  6  7            1  2  3  4  ",
                   " 4  5  6  7  8  9 10   8  9 10 11 12 13 14   5  6  7  8  9 10 11  ",
                   "11 12 13 14 15 16 17  15 16 17 18 19 20 21  12 13 14 15 16 17 18  ",
                   "18 19 20 21 22 23 24  22 23 24 25 26 27 28  19 20 21 22 23 24 25  ",
                   "25 26 27 28 29 30 31  29 30 31              26 27 28 29 30        ",
                   "                                                                  ",
                   "      October               November              December        ",
                   "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  ",
                   "                1  2      1  2  3  4  5  6            1  2  3  4  ",
                   " 3  4  5  6  7  8  9   7  8  9 10 11 12 13   5  6  7  8  9 10 11  ",
                   "10 11 12 13 14 15 16  14 15 16 17 18 19 20  12 13 14 15 16 17 18  ",
                   "17 18 19 20 21 22 23  21 22 23 24 25 26 27  19 20 21 22 23 24 25  ",
                   "24 25 26 27 28 29 30  28 29 30              26 27 28 29 30 31     ",
                   "31                                                                "], cal.three_column_year_array
  end
  def test_18_print_year_is_correct
    cal = Year.new(1886)
    assert_equal  """                            1886
      January               February               March          
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
                1  2      1  2  3  4  5  6      1  2  3  4  5  6  
 3  4  5  6  7  8  9   7  8  9 10 11 12 13   7  8  9 10 11 12 13  
10 11 12 13 14 15 16  14 15 16 17 18 19 20  14 15 16 17 18 19 20  
17 18 19 20 21 22 23  21 22 23 24 25 26 27  21 22 23 24 25 26 27  
24 25 26 27 28 29 30  28                    28 29 30 31           
31                                                                

       April                  May                   June          
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
             1  2  3                     1         1  2  3  4  5  
 4  5  6  7  8  9 10   2  3  4  5  6  7  8   6  7  8  9 10 11 12  
11 12 13 14 15 16 17   9 10 11 12 13 14 15  13 14 15 16 17 18 19  
18 19 20 21 22 23 24  16 17 18 19 20 21 22  20 21 22 23 24 25 26  
25 26 27 28 29 30     23 24 25 26 27 28 29  27 28 29 30           
                      30 31                                       

        July                 August              September        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
             1  2  3   1  2  3  4  5  6  7            1  2  3  4  
 4  5  6  7  8  9 10   8  9 10 11 12 13 14   5  6  7  8  9 10 11  
11 12 13 14 15 16 17  15 16 17 18 19 20 21  12 13 14 15 16 17 18  
18 19 20 21 22 23 24  22 23 24 25 26 27 28  19 20 21 22 23 24 25  
25 26 27 28 29 30 31  29 30 31              26 27 28 29 30        
                                                                  

      October               November              December        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
                1  2      1  2  3  4  5  6            1  2  3  4  
 3  4  5  6  7  8  9   7  8  9 10 11 12 13   5  6  7  8  9 10 11  
10 11 12 13 14 15 16  14 15 16 17 18 19 20  12 13 14 15 16 17 18  
17 18 19 20 21 22 23  21 22 23 24 25 26 27  19 20 21 22 23 24 25  
24 25 26 27 28 29 30  28 29 30              26 27 28 29 30 31     
31                                                                
""", cal.print_year
  end
  def test_19_generate_full_calendar_year
    cal = Year.new(3000)
    assert_equal  """                            3000
      January               February               March          
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
          1  2  3  4                     1                     1  
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   2  3  4  5  6  7  8  
12 13 14 15 16 17 18   9 10 11 12 13 14 15   9 10 11 12 13 14 15  
19 20 21 22 23 24 25  16 17 18 19 20 21 22  16 17 18 19 20 21 22  
26 27 28 29 30 31     23 24 25 26 27 28     23 24 25 26 27 28 29  
                                            30 31                 

       April                  May                   June          
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
       1  2  3  4  5               1  2  3   1  2  3  4  5  6  7  
 6  7  8  9 10 11 12   4  5  6  7  8  9 10   8  9 10 11 12 13 14  
13 14 15 16 17 18 19  11 12 13 14 15 16 17  15 16 17 18 19 20 21  
20 21 22 23 24 25 26  18 19 20 21 22 23 24  22 23 24 25 26 27 28  
27 28 29 30           25 26 27 28 29 30 31  29 30                 
                                                                  

        July                 August              September        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
       1  2  3  4  5                  1  2      1  2  3  4  5  6  
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   7  8  9 10 11 12 13  
13 14 15 16 17 18 19  10 11 12 13 14 15 16  14 15 16 17 18 19 20  
20 21 22 23 24 25 26  17 18 19 20 21 22 23  21 22 23 24 25 26 27  
27 28 29 30 31        24 25 26 27 28 29 30  28 29 30              
                      31                                          

      October               November              December        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
          1  2  3  4                     1      1  2  3  4  5  6  
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   7  8  9 10 11 12 13  
12 13 14 15 16 17 18   9 10 11 12 13 14 15  14 15 16 17 18 19 20  
19 20 21 22 23 24 25  16 17 18 19 20 21 22  21 22 23 24 25 26 27  
26 27 28 29 30 31     23 24 25 26 27 28 29  28 29 30 31           
                      30                                          
""", cal.print_year
  end

  def test_21_test_compile_three_months
    cal = cal = Year.new(1886)
    assert_equal ["      January               February               March          ",
                   "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  ",
                   "                1  2      1  2  3  4  5  6      1  2  3  4  5  6  ",
                   " 3  4  5  6  7  8  9   7  8  9 10 11 12 13   7  8  9 10 11 12 13  ",
                   "10 11 12 13 14 15 16  14 15 16 17 18 19 20  14 15 16 17 18 19 20  ",
                   "17 18 19 20 21 22 23  21 22 23 24 25 26 27  21 22 23 24 25 26 27  ",
                   "24 25 26 27 28 29 30  28                    28 29 30 31           ",
                   "31                                                                ",], cal.compile_three_months(0)
  end
end
