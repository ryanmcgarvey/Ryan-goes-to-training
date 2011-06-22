Given /^I have opened "([^\"]*)"$/ do |site|
  visit site
end

When /^I search for "([^\"]*)"$/ do |term|
  fill_in "q", :with => term
  click_button "Google Search"
end

Then /^I should see a link to "([^\"]*)" with text "([^\"]*)"$/ do |url, text|
  
  assert_have_selector("a[href='#{ url }']") do |element|
    assert_contain Regexp.new(element.text)
  end
end