Given("I am on the home page") do
  visit "https://yes-boi-scoutfreak.c9users.io/users/sign_in"
end

Then("I enter my username") do
  fill_in 'Email', :with => "tony@gmail.com"
end

Then("I enter my Password") do
  fill_in 'Password', :with => "tacocat"
end

Then("I log in") do
  click_button("Log in")
end

