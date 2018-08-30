# CS 1632 - Software Quality Assurance
Summer Semester 2018
ASSIGNED 5 JUNE 2018, DUE 26 JUNE 2018 (Late Due Date 28 JUNE 2018: -15 points)

## Deliverable 2

For this assignment, you (not a group) will write code and unit tests for Ruby Gold Rush, a simulator of prospectors hunting for gold and silver during the California Gold Rush and the Nevada Silver Rush.

Requirements for this program are in the `requirements.md` file in this directory.  Sample output is also provided for several runs of the program.  In case of ambiguity, please see the sample output as an example of what to display and how the system should work.  Note that the sample output shows specific routes for given seeds - you do NOT have to have your seeds create the exact same routes.  They are purely for demonstration purposes.

This program must be written in Ruby and use minitest for the unit tests.  This program must use rubocop with the attached .rubocop.yml configuration and SimpleCov as described in class.

All code and tests should be on GitHub in a private repository accessible to me.

Your repository MUST be named D2.  If you are going to have a separate repository for extra credit, it MUST be named D2_EC.

## Format
You should turn in a title page with:

* The title "CS 1632 - DELIVERABLE 2: Unit Testing Ruby Gold Rush"
* Your name
* Your GitHub username
* The URL of your code and tests on GitHub

ENSURE THAT THE THE TA AND I ARE ADDED AS A COLLABORATOR ON GITHUB!  My username is `laboon`.  The TA's username is `mraoufi`.  You will lose an automatic 10 points if either I or the TA cannot access your repository.

Before turning this assignment in, I HIGHLY recommend you double-check that all of the code that you think is committed is in fact committed by (1) looking at the code on the GitHub web interface and (2) cloning it down to a new directory on your machine and trying to run it from there.

Add a short ( < 1 page ) description of issues you faced when writing this code and tests.  If any tests you wrote fail, they should be included here, along with why you think that they are failing.

After this, ON A SEPARATE PAGE, include a screen shot of the executed unit tests (this usually means a SCREENSHOT of your terminal - do not just copy and paste the results).    If a test doesn't pass, it should be included in the concerns section above.  Ideally, for a perfect grade, all tests should be green (passing).  However, if you have what you think is a valid test and it is not passing, I would prefer that you include a defect report (in the proper template!) rather than just deleting it.  Knowing that a defect exists and reporting it is much better than having it discovered by the customer (me)!

There is no need to print out the code itself.  It should be on GitHub BY THE BEGINNING OF CLASS.

At least four (4) unit tests should use stubbing of methods.

At least three (3) unit tests should testing an edge case.  These should be marked in the comments above with the term "EDGE CASE" in all-caps on its own line, like so:

```ruby
# This unit test checks what happens if we try to set a value
# larger than the maximum value.  It should return -1 in that case.
# EDGE CASE
```

There should be a minimum of sixteen (16) unit tests and 90% statement coverage as measured by SimpleCov.

Note that the above are ABSOLUTE MINIMUM values.  You may have more unit tests or higher statement coverage.

Rubocop should show no errors or warnings when run with the included .rubocop.yml file.  I will give you three "get out of jail free" cards on this - you can have up to three errors or warnings with no loss of credit.  However, for every error past this, you will receive -2 points, up to a total of -10 for the project.

Note that this only counts for SOURCE files, not test files.  You may ignore test files for Rubocop purposes.

Group the unit tests for each method together (see format below).  Before each group of unit tests for a method, do an equivalence class partitioning for that method OR, for a method that does not lend itself to this, indicate why not.  For example, assume you have a method which just prints a line of asterisks to the console:

```ruby
def print_line
  80.times { print '*' }
  puts
end
```

You can write down that as the method does the same thing every time, and has no parameters, it does not make sense to partition it.  Generally, this should be a rare case.  The following method, for example, definitely does have multiple equivalence classes and should be partitioned!

```ruby
def print_line n
  n.times { print '*' }
  puts
end
```
If you have a method which seems like it would have an extreme number of equivalence classes (>6), perhaps due to a large number of parameters, you may instead just write down a list of possible success and failure cases.  For example,

```ruby
# Returns concatenated version of all vars.
# SUCCESS CASES: All variables are valid and contain something that can be stringified
# FAILURE CASES: If any variable is nil, that area is blank
#                If g or h is not a number, will return ---
#                If any other variable cannot have .to_s called on it, will return ---

# REFERENCED METHOD
def concat_stuff a, b, c, d, e, f, g, h
  "#{a}: #{b} and #{c} / #{d} / #{e} (#{f}:#{g + h}"
rescue
  "---"
end
```

The following format should be used:

```ruby
# UNIT TESTS FOR METHOD absolute_value(x)
# Equivalence classes:
# x= -INFINITY..-1 -> returns -x
# x= 0..INFINITY -> returns x
# x= (not a number) -> returns nil

# If a negative value is given for x, then -x is returned.
def test_negative_val
  assert_equal 1, absolute_value(-1)
end

# If a positive value is given for x, then x is returned.
def test_positive_val
  assert_equal 1, absolute_value(1)
end

# If an invalid value, such as a string, is given for x,
# then nil is returned.
# EDGE CASE
def test_invalid_val
  assert_nil absolute_value("poodle")
end
```

Keep in mind some of the things we learned when doing manual testing; you should be cognizant of equivalence classes, boundary values, etc. and focus on them.

The program should use appropriate object-oriented design.  Think of what objects could possibly exist to describe this world, and what methods they should have.  Do not attempt to do this with no classes or methods, etc.  It is, of course, possible, but will make testing more difficult!

For this project, you should endeavour to get a good sampling of different equivalence classes and success/failure cases.

If you are not familiar with seeds for random number generators, recall that in the absence of external input, a computer can only generate data deterministically.  This seed will act as our "external input".  I recommend you review the Ruby Random class: http://ruby-doc.org/core-2.5.0/Random.html  Remember that running your program twice with the same seed should *always* produce the same output.

Before each test, add some comments (two or three sentences, on average) explaining what the test is checking.

## Grading
I remind you that grammar and good code count as well as functionality.  By good code, I mean: no commented-out code unless there's an EXPLICIT reason, properly indented code, no misspelled words or bad grammar, in comments or summaries, etc.

The program must be run by typing `ruby gold_rush.rb *seed* *number of prospectors*`  at the command line.  It will be run using Ruby 2.5.0 and so I recommend you ensure that you have the same version.

The unit tests must be run by typing the following at the command line: `ruby gold_rush_test.rb`.  gold_rush_test.rb should require_relative any class-based test files that you use and run them as well.  All tests should be run by this one command.

You may ignore the main `gold_rush.rb` file IF AND ONLY IF it has fewer than 15 lines of code.  This will be very useful when developing your tests, so I recommend you look back at D1 and the sample code to see how they are laid out in order to see how to minimize the number of lines in `gold_rush.rb`.

You will lose points if the program itself runs when I try to run the tests.  If you are having trouble with this, remember that any code that you require by a test file will be run.  Having a very small "main" file, which "require_relatives" many files that only have classes, will help you avoid this situation.

Unlike D1, you do NOT need to precisely line up requirements with test cases or develop a traceability matrix, but requirements are still useful for doing exploratory testing of your finished product.

## Extra Credit and Competition

If you are going to try for the extra credit, you should create a SEPARATE repository, `D2_EC`.  I recommend you make sure that your "original" D2 works entirely correctly before trying for the extra credit.

For extra credit, whenever the prospector moves, you should show a map with their location.  This description is left intentionally vague!

You can receive up to five extra credit points, although the grading for the extra credit is a bit subjective.  Creating a simple map showing the current location may be worth one or two points.  Creating a map which includes text animation such as showing the "prospector" move from one location to the other (using the `curses` gem or something similar) would be worth three or four points.  Creating a GUI and loading images may be worth four or five points.

The extra credit should also have unit tests included.

Finally, the assignment that I MOST impressed with will win an Android Things kit (includes NXP board, Rainbow Hat extension, screen, camera, wi-fi and ethernet hookups).  This is entirely subjective, but I will be looking at:

1. Is the code well-written?
2. Is the code well-tested?
3. How difficult/ambitious is the extra credit?
4. Is the system well-designed using proper object-oriented techniques?

## Grading Breakdown
* Summary and Testing Concerns- 5%
* Screenshot of executed unit tests - 5%
* Program Functionality - 45%
* Test Code (including statement coverage) - 45%
* [-2 for every Rubocop error past 3, up to -10]

Please feel free to email me or come to office hours to discuss any problems you have.
