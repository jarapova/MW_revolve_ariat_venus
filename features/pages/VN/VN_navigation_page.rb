# In this module we collecting methods for Navigations page of VN
require 'capybara/cucumber'


module VN_NavigationPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.select_random_item
      page.assert_selector(:xpath, "//div[contains(@id,'item-')]")
      item_count_on_page = find_all(:xpath, "//div[contains(@id,'item-')]").count
      random_item_index = Random.rand(0...item_count_on_page)
      item_name,  item_price,  item_price_discount = get_item_parameters_category_page(random_item_index)
      p  "I see #{item_name} with price #{item_price} and discount #{item_price_discount}"

      find(:xpath, "//div[@id='item-#{random_item_index}']").click
      p  "I've clicken on #{item_name} image"
      expect(page).to have_text(item_price)
      p  "Price is correct on PDP page"
      return item_name, item_price, item_price_discount
    end
end

def self.get_breadcrumbs
  breadcrumbs_elements_count = find_all(:xpath, "//div[contains(@style, 'block')]/div[1]/span[1]//span").count
  p  "I see #{breadcrumbs_elements_count} elements in breadcrumds"
  breadcrumbs_array = Array.new
  for i in 1..breadcrumbs_elements_count
    breadcrumbs_names = find(:xpath, "//div[contains(@style, 'block')]/div[1]/span[1]//span[#{i}]").text
    breadcrumbs_array << breadcrumbs_names
  end
  return breadcrumbs_array
end



def self.get_item_parameters_category_page (item_index_in_the_list)
  p item_name = find(:xpath, "//div[@id='item-#{item_index_in_the_list}']//h3").text
  item_text = find(:xpath, "//div[@id='item-#{item_index_in_the_list}']").text.tr("view detail","")
  item_parameters = item_text.split(/\n/)
  p item_name = item_parameters[0]
  p item_price_value =item_parameters[1].split('$')[1]
  p item_price_discount_value =item_parameters[1].split('$')[2]
  return item_name , item_price = "$#{item_price_value}" , item_price_discount = "$#{item_price_discount_value}"
end

# Given(/^user navigating to "([^"]*)" PDP by clicking product image$/) do |product_name|
#   product_name_to_ta = product_name.capitalize.tr(" ","")
#   find(:xpath, ta("venus:navigationSubcategory:productImg#{product_name_to_ta}", "((//h3[text()='#{product_name}'])[1]/preceding::div[1])/following::img[1]"))
# end