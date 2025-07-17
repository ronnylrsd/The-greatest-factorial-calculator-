#utf-8
#language: en

Feature: Calculate factorial numbers

    Feature Description: A factorial number is the result of multiplying a whole number by every positive whole number less than it.
    It's commonly used in math, statistics, and computer science - especially in problems involving combinations, permutations, and sequences.

    Background: Given the user is on the factorial calculator page
        Given I visit the factorial calculator page

    Scenario: TC01 - Calculate the factorial of a letter
        When I enter "a" in the input field
        And I click the "Calculate!" button
        Then I should see an error message "Please enter an integer"

    Scenario: TC02 - Calculate the factorial of a text
        When I enter "factorial!" in the input field
        And I click the "Calculate!" button
        Then I should see an error message "Please enter an integer"

    Scenario: TC03 - Calculate the factorial of an empty input
        And I click the "Calculate!" button
        Then I should see an error message "Please enter an integer"

    Scenario: TC04 - Calculate the factorial of a negative number
        When I enter "-5" in the input field
        And I click the "Calculate!" button
        Then I should see an error message "Please enter a non-negative integer"

    Scenario: TC05 - Calculate the factorial of zero
        When I enter "0" in the input field
        And I click the "Calculate!" button
        Then I should see the result "1" displayed

    Scenario: TC06 - Calculate the factorial of a decimal number
        When I enter "3.5" in the input field
        And I click the "Calculate!" button
        Then I should see an error message "Please enter an integer"

    Scenario: TC07 - Calculate the factorial of a number
        When I enter "5" in the input field
        And I click the "Calculate!" button
        Then I should see the result "120" displayed

    Scenario: TC08 - Paste a number in the input field
        When I paste "1" into the input field
        And I click the "Calculate!" button
        Then I should see the result "1" displayed

    Scenario: TC09 - Navigate using TAB to calculate the factorial
        When I navigate using TAB to focus on the "input field"
        And I enter "10" in the input field
        And I navigate using TAB to focus on the "Calculate! button"
        And I click the "Calculate!" button
        Then I should see the result "3628800" displayed

    Scenario: TC10 - Calculate the lower infinity boundary of the factorial
        When I enter "169" in the input field
        And I click the "Calculate!" button
        Then I should see the result "4.269068009004705e+304" displayed

    Scenario: TC11 - Calculate the exact infinity boundary of the factorial
        When I enter "170" in the input field
        And I click the "Calculate!" button
        Then I should see the result "7.257415615307999e+306" displayed

    Scenario: TC12 - Calculate the upper infinity boundary of the factorial
        When I enter "171" in the input field
        And I click the "Calculate!" button
        Then I should see the result "Infinity" displayed

    Scenario: TC13 - Calculate the factorial of a number after an error is displayed
        When I enter "171.5" in the input field
        And I click the "Calculate!" button
        Then I should see an error message "Please enter an integer"
        When I enter "100" in the input field
        And I click the "Calculate!" button
        Then I should see the result "9.332621544394415e+157" displayed
        And I should not see an error message "Please enter an integer"

    Scenario: TC14 - Calculate the factorial of a number with trailing spaces
        When I enter "  4  " in the input field
        And I click the "Calculate!" button
        Then I should see the result "24" displayed

    Scenario: TC15 - Calculate the factorial of the max integer number
        When I enter "max" in the input field
        And I click the "Calculate!" button
        Then I should see the result "Infinity" displayed

    Scenario: TC16 - Calculate the factorial of a number with leading zeros
        When I enter "0006" in the input field
        And I click the "Calculate!" button
        Then I should see the result "720" displayed

    Scenario: TC17 - Stress the Calculate! button
        When I enter "12" in the input field
        And I click the "Calculate!" button 100 times
        Then I should see the result "479001600" displayed

    Scenario: TC18 - Calculate the factorial of a number pressing Enter key
        When I enter "8" in the input field
        And I press the "ENTER" key
        Then I should see the result "40320" displayed

    Scenario: TC19 - Change the interface to mobile view
        When I change the viewport to mobile
        And I enter "150" in the input field
        And I click the "Calculate!" button
        Then I should see the result "5.713383956445855e+262" displayed

    Scenario: TC20 - Data persistence after page reload
        When I enter "6" in the input field
        And I click the "Calculate!" button
        Then I should see the result "720" displayed
        When I reload the page
        Then I should see the result "720" displayed
