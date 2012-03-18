Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database
  #Given I have added "Aladdin" with rating "G" and release date "25-Nov-1992"
  #Given I have added "The Terminator" with rating "R" and release date "26-Oct-1984"
  #Given I have added "When Harry Met Sally" with rating "R" and release date "21-Jul-1989"
  #Given I have added "The Help" with rating "PG-13" and release date "10-Aug-2011"
  #Given I have added "Chocolat" with rating "PG-13" and release date "5-Jan-2001"
  #Given I have added "Amelie" with rating "R" and release date "25-Apr-2001"
  #Given I have added "2001: A Space Odyssey" with rating "G" and release date "6-Apr-1968"
  #Given I have added "The Incredibles" with rating "PG" and release date "5-Nov-2004"
  #Given I have added "Raiders of the Lost Ark" with rating "PG" and release date "12-Jun-1981"
  #Given I have added "Chicken Run" with rating "G" and release date "21-Jun-2000"

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And  I am on the RottenPotatoes home page
  
Scenario: restrict to movies with "PG" or "R" ratings
  # enter step(s) to check the "PG" and "R" checkboxes
  When I check the following ratings: PG,R
  # enter step(s) to uncheck all other checkboxes
  And I uncheck the following ratings: G,PG-13
  # enter step to "submit" the search form on the homepage
  And I press "ratings_submit"
  # enter step(s) to ensure that PG and R movies are visible
  Then I should see "Raiders of the Lost Ark"
  Then I should see "Amelie"
  # enter step(s) to ensure that other movies are not visible
  Then I should not see "Chicken Run"
  Then I should not see "The Help"

Scenario: no ratings selected
  # see assignment
  # enter step(s) to check the "PG" and "R" checkboxes
  When I uncheck the following ratings: PG,R,PG-13,G
  # enter step to "submit" the search form on the homepage
  And I press "ratings_submit"
  # enter step(s) to ensure that PG and R movies are visible
  Then I should see none of the movies

Scenario: all ratings selected
  # see assignment
  # enter step(s) to check the "PG" and "R" checkboxes
  When I check the following ratings: PG,R,PG-13,G
  # enter step to "submit" the search form on the homepage
  And I press "ratings_submit"
  # enter step(s) to ensure that PG and R movies are visible
  Then I should see all of the movies

