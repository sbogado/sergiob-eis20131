require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

When /^I am on the home page$/ do
  visit("/")
end

Then /^I should see "([^"]*)"$/ do |mensaje_esperado|
  if page.respond_to? :should
    page.should have_content(mensaje_esperado)
  else
    assert page.has_content?(mensaje_esperado)
  end	
end

