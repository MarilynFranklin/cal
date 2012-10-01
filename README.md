Cal
===============

Goal / Intentions 
-----------------


	Cal.rb was created in order to simulate the behavior of the Unix cal program. 


Features
--------


	This library allows the user to print out the accurate calendar for a given month or entire year.


Limitations
-----------


	Currently, cal.rb only works for years 1800-3000.


How to use
----------


	To print a month, type in terminal:

	ruby cal.rb 2 2012

	
	-or-

	
	ruby cal.rb feb 2012

	
	To print an entire year, type in terminal:

	ruby cal.rb 2012


Dependencies
------------


	Ruby vs. 1.9.3


File Structure
--------------


	-readme.md

	-rakefile

	-cal.rb

	-lib
		-calender.rb
		-constants.rb
	-tests
		-test_cal.rb


Author Information
------------------


	Marilyn Franklin


Contribution Guidelines
-----------------------


	For all pull requests:

	1. Ensure new code is properly documented

	2. Implement new unit tests

	3. All tests must pass


Bugs / To-Do
------------


	Cal.rb does not automatically detect current year


Changelog
---------


	10-01-2012
		-calender.rb code now works for full year and individual months

		-calender.rb added documentation for zeller's congruence and leap year calculations

		-readme.md added 


Difficult Code
--------------


	In zeller's congruence, January and February are calculated as months 13 and 14. Also, 
	they are counted as being apart of the previous year.


Resources
---------


	Information on Zeller's Congruence was found at:
	http://en.wikipedia.org/wiki/Zeller%27s_congruence

	Information on determining leap years was found at:
	http://en.wikipedia.org/wiki/Leap_year