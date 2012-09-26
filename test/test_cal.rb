require 'test/unit'
require 'calendar'

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

  def test_07_number_of_days_in_month
    assert_equal 31, MONTHS[12][:days_in_month]
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
  def test_15_calendar_month_array_correct_num_days
    assert_equal  ["        July        ", "Su Mo Tu We Th Fr Sa", "             1  2  3", " 4  5  6  7  8  9 10", "11 12 13 14 15 16 17", "18 19 20 21 22 23 24", "25 26 27 28 29 30 31", "                    "], generate_month_without_year_in_title(7, 1886)
  end
  def test_16_calendar_month_array_correct_num_days
    assert_equal  [["      January       ",
  "Su Mo Tu We Th Fr Sa",
  "                1  2",
  " 3  4  5  6  7  8  9",
  "10 11 12 13 14 15 16",
  "17 18 19 20 21 22 23",
  "24 25 26 27 28 29 30",
  "31                  "],
 ["      February      ",
  "Su Mo Tu We Th Fr Sa",
  "    1  2  3  4  5  6",
  " 7  8  9 10 11 12 13",
  "14 15 16 17 18 19 20",
  "21 22 23 24 25 26 27",
  "28                  ",
  "                    "],
 ["       March        ",
  "Su Mo Tu We Th Fr Sa",
  "    1  2  3  4  5  6",
  " 7  8  9 10 11 12 13",
  "14 15 16 17 18 19 20",
  "21 22 23 24 25 26 27",
  "28 29 30 31         ",
  "                    "],
 ["       April        ",
  "Su Mo Tu We Th Fr Sa",
  "             1  2  3",
  " 4  5  6  7  8  9 10",
  "11 12 13 14 15 16 17",
  "18 19 20 21 22 23 24",
  "25 26 27 28 29 30   ",
  "                    "],
 ["        May         ",
  "Su Mo Tu We Th Fr Sa",
  "                   1",
  " 2  3  4  5  6  7  8",
  " 9 10 11 12 13 14 15",
  "16 17 18 19 20 21 22",
  "23 24 25 26 27 28 29",
  "30 31               "],
 ["        June        ",
  "Su Mo Tu We Th Fr Sa",
  "       1  2  3  4  5",
  " 6  7  8  9 10 11 12",
  "13 14 15 16 17 18 19",
  "20 21 22 23 24 25 26",
  "27 28 29 30         ",
  "                    "],
 ["        July        ",
  "Su Mo Tu We Th Fr Sa",
  "             1  2  3",
  " 4  5  6  7  8  9 10",
  "11 12 13 14 15 16 17",
  "18 19 20 21 22 23 24",
  "25 26 27 28 29 30 31",
  "                    "],
 ["       August       ",
  "Su Mo Tu We Th Fr Sa",
  " 1  2  3  4  5  6  7",
  " 8  9 10 11 12 13 14",
  "15 16 17 18 19 20 21",
  "22 23 24 25 26 27 28",
  "29 30 31            ",
  "                    "],
 ["     September      ",
  "Su Mo Tu We Th Fr Sa",
  "          1  2  3  4",
  " 5  6  7  8  9 10 11",
  "12 13 14 15 16 17 18",
  "19 20 21 22 23 24 25",
  "26 27 28 29 30      ",
  "                    "],
 ["      October       ",
  "Su Mo Tu We Th Fr Sa",
  "                1  2",
  " 3  4  5  6  7  8  9",
  "10 11 12 13 14 15 16",
  "17 18 19 20 21 22 23",
  "24 25 26 27 28 29 30",
  "31                  "],
 ["      November      ",
  "Su Mo Tu We Th Fr Sa",
  "    1  2  3  4  5  6",
  " 7  8  9 10 11 12 13",
  "14 15 16 17 18 19 20",
  "21 22 23 24 25 26 27",
  "28 29 30            ",
  "                    "],
 ["      December      ",
  "Su Mo Tu We Th Fr Sa",
  "          1  2  3  4",
  " 5  6  7  8  9 10 11",
  "12 13 14 15 16 17 18",
  "19 20 21 22 23 24 25",
  "26 27 28 29 30 31   ",
  "                    "]], complete_year(1886)
  end

  def test_17_pretty_year_is_correct
    assert_equal  ["      January               February               March        ",
 "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa",
 "                1  2      1  2  3  4  5  6      1  2  3  4  5  6",
 " 3  4  5  6  7  8  9   7  8  9 10 11 12 13   7  8  9 10 11 12 13",
 "10 11 12 13 14 15 16  14 15 16 17 18 19 20  14 15 16 17 18 19 20",
 "17 18 19 20 21 22 23  21 22 23 24 25 26 27  21 22 23 24 25 26 27",
 "24 25 26 27 28 29 30  28                    28 29 30 31         ",
 "31                                                              ",
 "       April                  May                   June        ",
 "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa",
 "             1  2  3                     1         1  2  3  4  5",
 " 4  5  6  7  8  9 10   2  3  4  5  6  7  8   6  7  8  9 10 11 12",
 "11 12 13 14 15 16 17   9 10 11 12 13 14 15  13 14 15 16 17 18 19",
 "18 19 20 21 22 23 24  16 17 18 19 20 21 22  20 21 22 23 24 25 26",
 "25 26 27 28 29 30     23 24 25 26 27 28 29  27 28 29 30         ",
 "                      30 31                                     ",
 "        July                 August              September      ",
 "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa",
 "             1  2  3   1  2  3  4  5  6  7            1  2  3  4",
 " 4  5  6  7  8  9 10   8  9 10 11 12 13 14   5  6  7  8  9 10 11",
 "11 12 13 14 15 16 17  15 16 17 18 19 20 21  12 13 14 15 16 17 18",
 "18 19 20 21 22 23 24  22 23 24 25 26 27 28  19 20 21 22 23 24 25",
 "25 26 27 28 29 30 31  29 30 31              26 27 28 29 30      ",
 "                                                                ",
 "      October               November              December      ",
 "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa",
 "                1  2      1  2  3  4  5  6            1  2  3  4",
 " 3  4  5  6  7  8  9   7  8  9 10 11 12 13   5  6  7  8  9 10 11",
 "10 11 12 13 14 15 16  14 15 16 17 18 19 20  12 13 14 15 16 17 18",
 "17 18 19 20 21 22 23  21 22 23 24 25 26 27  19 20 21 22 23 24 25",
 "24 25 26 27 28 29 30  28 29 30              26 27 28 29 30 31   ",
 "31                                                              "], year_pretty(complete_year(1886))
  end
  def test_17_pretty_year_is_correct
    assert_equal  "                              1886                              \n      January               February               March        \nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n                1  2      1  2  3  4  5  6      1  2  3  4  5  6\n 3  4  5  6  7  8  9   7  8  9 10 11 12 13   7  8  9 10 11 12 13\n10 11 12 13 14 15 16  14 15 16 17 18 19 20  14 15 16 17 18 19 20\n17 18 19 20 21 22 23  21 22 23 24 25 26 27  21 22 23 24 25 26 27\n24 25 26 27 28 29 30  28                    28 29 30 31         \n31                                                              \n                                                                \n       April                  May                   June        \nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n             1  2  3                     1         1  2  3  4  5\n 4  5  6  7  8  9 10   2  3  4  5  6  7  8   6  7  8  9 10 11 12\n11 12 13 14 15 16 17   9 10 11 12 13 14 15  13 14 15 16 17 18 19\n18 19 20 21 22 23 24  16 17 18 19 20 21 22  20 21 22 23 24 25 26\n25 26 27 28 29 30     23 24 25 26 27 28 29  27 28 29 30         \n                      30 31                                     \n                                                                \n        July                 August              September      \nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n             1  2  3   1  2  3  4  5  6  7            1  2  3  4\n 4  5  6  7  8  9 10   8  9 10 11 12 13 14   5  6  7  8  9 10 11\n11 12 13 14 15 16 17  15 16 17 18 19 20 21  12 13 14 15 16 17 18\n18 19 20 21 22 23 24  22 23 24 25 26 27 28  19 20 21 22 23 24 25\n25 26 27 28 29 30 31  29 30 31              26 27 28 29 30      \n                                                                \n                                                                \n      October               November              December      \nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n                1  2      1  2  3  4  5  6            1  2  3  4\n 3  4  5  6  7  8  9   7  8  9 10 11 12 13   5  6  7  8  9 10 11\n10 11 12 13 14 15 16  14 15 16 17 18 19 20  12 13 14 15 16 17 18\n17 18 19 20 21 22 23  21 22 23 24 25 26 27  19 20 21 22 23 24 25\n24 25 26 27 28 29 30  28 29 30              26 27 28 29 30 31   \n31                                                              \n                                                                \n", print_year(year_pretty(complete_year(1886)), 1886)
  end
  def test_17_generate_full_calendar_year
    assert_equal  "                              1886                              \n      January               February               March        \nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n                1  2      1  2  3  4  5  6      1  2  3  4  5  6\n 3  4  5  6  7  8  9   7  8  9 10 11 12 13   7  8  9 10 11 12 13\n10 11 12 13 14 15 16  14 15 16 17 18 19 20  14 15 16 17 18 19 20\n17 18 19 20 21 22 23  21 22 23 24 25 26 27  21 22 23 24 25 26 27\n24 25 26 27 28 29 30  28                    28 29 30 31         \n31                                                              \n                                                                \n       April                  May                   June        \nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n             1  2  3                     1         1  2  3  4  5\n 4  5  6  7  8  9 10   2  3  4  5  6  7  8   6  7  8  9 10 11 12\n11 12 13 14 15 16 17   9 10 11 12 13 14 15  13 14 15 16 17 18 19\n18 19 20 21 22 23 24  16 17 18 19 20 21 22  20 21 22 23 24 25 26\n25 26 27 28 29 30     23 24 25 26 27 28 29  27 28 29 30         \n                      30 31                                     \n                                                                \n        July                 August              September      \nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n             1  2  3   1  2  3  4  5  6  7            1  2  3  4\n 4  5  6  7  8  9 10   8  9 10 11 12 13 14   5  6  7  8  9 10 11\n11 12 13 14 15 16 17  15 16 17 18 19 20 21  12 13 14 15 16 17 18\n18 19 20 21 22 23 24  22 23 24 25 26 27 28  19 20 21 22 23 24 25\n25 26 27 28 29 30 31  29 30 31              26 27 28 29 30      \n                                                                \n                                                                \n      October               November              December      \nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n                1  2      1  2  3  4  5  6            1  2  3  4\n 3  4  5  6  7  8  9   7  8  9 10 11 12 13   5  6  7  8  9 10 11\n10 11 12 13 14 15 16  14 15 16 17 18 19 20  12 13 14 15 16 17 18\n17 18 19 20 21 22 23  21 22 23 24 25 26 27  19 20 21 22 23 24 25\n24 25 26 27 28 29 30  28 29 30              26 27 28 29 30 31   \n31                                                              \n                                                                \n", generate_calendar_full_year(1886)
  end
end
