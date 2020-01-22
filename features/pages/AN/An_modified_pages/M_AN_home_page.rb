require 'capybara/cucumber'

class M_AN_home_page
  extend Capybara::DSL
  extend RSpec::Matchers

  URL = 'https://annieselke.com/'

  CATEGORIES = ["Rugs",
                "Bedding",
                "Furniture",
                "Bath",
                "Décor & Pillows",
                "Sleepwear",
                "Accessories",
                "Collections",
                "Gifts",
                "Sale"]
  FOOTER_CATEGORIES = [
      "annie selke",
      "pine cone hill",
      "dash & albert",
      "the outlet",
      "ideas and inspirations",
      "catalog"
  ]

  def self.visit_home_page
    visit URL
  end

  def self.hamburger_icon_click
    find(:xpath, "//button[@aria-label='Menu']").click
    p  "Clicked on Hamburger icon in header"
    if page.has_selector?(:xpath, "//a[text()='Login']")
      p  "Hamburger of not logged user"
    elsif
    page.has_selector?(:xpath, "//a[text()='My Account']")
      p  "Hamburger of logged user"
    end
  end

  def self.all_expected_content_in_hamburger_menu

      find(:xpath, "//a[text()='Login']")

      for i in 0..CATEGORIES.count()
        expect(find_category(CATEGORIES[i]).text).to eq(CATEGORIES)
      end



  end

  def self.find_category(category_name)
    find(:xpath, "//div[text()='#{category_name}']/parent::li")
  end

end
