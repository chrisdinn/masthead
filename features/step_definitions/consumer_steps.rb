Given /^there are valid consumers$/ do
  @consumers = (1..5).collect{ Factory(:consumer) }
end

Then /^I should see all the consumers$/ do
  for consumer in @consumers
    Then %{I should see "#{ consumer.label }"}
    Then %{I should see "#{ consumer.url }"}
  end
end

When /^I fill out the consumer form$/ do
  @consumer_details = Factory.attributes_for(:consumer)
  When %{I fill in "#{@consumer_details[:label]}" for "Label"}
  When %{I fill in "#{@consumer_details[:url]}" for "Url"}
end

Then /^I should see the consumer on the consumers page$/ do
  Then %{I should see "#{ @consumer_details[:label]}"}
  And %{I should see "#{ @consumer_details[:url]}"}
end

When /^I follow the delete link next to a consumer$/ do
  @consumer = @consumers.first
  visit consumer_url(@consumer), :delete
end

Then /^that consumer should no longer have access$/ do
  Consumer.find_by_id(@consumer.id).should be_blank
end