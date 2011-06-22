Feature: Search Google
  In order to make sure people can find me
  And to satisfy my vanity
  I want to check that my web page is listed on the first page of a Google search for me

  Scenario: Searching for Chad Fowler
    Given I have opened "http://www.google.com/"
    When I search for "Chad Fowler"
    Then I should see a link to "http://chadfowler.com/" with text "The Passionate Programmer"