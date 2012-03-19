
# Add a declarative step here for populating the DB with movies.
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    #Movie.create!(movie)
    @movie = Movie.create!(movie)
    @movie.save
  end
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #puts #all("table#movies tr").raw
  regexp = Regexp.new ".*#{e1}.*#{e2}",Regexp::MULTILINE
  assert page.body =~ regexp
end

Then /I should see all of the movies/ do
  #debugger
  #tbl = "table#movies" #.rows.should == Movies.count
  #puts all("table#movies tr").count
  #puts Movie.count
  #assert all("table#movies tr").count == Movie.count
  step %Q{I should see "Aladdin"}                
  step %Q{I should see "The Terminator"}
  step %Q{I should see "When Harry Met Sally"}  
  step %Q{I should see "The Help"}               
  step %Q{I should see "Chocolat"}             
  step %Q{I should see "Amelie"}                 
  step %Q{I should see "2001: A Space Odyssey"}  
  step %Q{I should see "The Incredibles"}        
  step %Q{I should see "Raiders of the Lost Ark"}
  step %Q{I should see "Chicken Run"}
end

Then /I should see none of the movies/ do
  step %Q{I should not see "Aladdin"}                
  step %Q{I should not see "The Terminator"}
  step %Q{I should not see "When Harry Met Sally"}  
  step %Q{I should not see "The Help"}               
  step %Q{I should not see "Chocolat"}             
  step %Q{I should not see "Amelie"}                 
  step %Q{I should not see "2001: A Space Odyssey"}  
  step %Q{I should not see "The Incredibles"}        
  step %Q{I should not see "Raiders of the Lost Ark"}
  step %Q{I should not see "Chicken Run"}
end

##### page.should have_selector('table tr', :count => 3)

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(",").each do |rating|
    #if uncheck
      #debugger
      if (uncheck == nil)
        step %Q{I check "ratings[#{rating}]"}
      else
        step %Q{I uncheck "ratings[#{rating}]"}
      end
  end
  
end
