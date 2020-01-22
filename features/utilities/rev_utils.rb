require 'yaml'

$revolve_stored_information = Hash.new

REV_HEADER_ELEMENTS = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_header_elements.yaml'))
REV_TEST_DATA_LINKS = YAML.load_file(File.join(__dir__, '../data/REV_test_data_links.yaml'))
REV_PRODUCT_LIST_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_product_list_page_content.yaml'))
REV_PRODUCT_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_product_page_content.yaml'))
REV_HAMBURGER_MENU_CONTENT = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_hamburger_menu_content.yaml'))
REV_HOME_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_home_page_content.yaml'))
REV_TEST_ITEMS = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_test_items.yaml'))
REV_ACCOUNT_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_account_page_content.yaml'))
REV_SIGN_IN_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_sign_in_page_content.yaml'))
REV_CART_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_cart_page_content.yaml'))
REV_CHECKOUT_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_checkout_page_content.yaml'))
REV_FOOTER_CONTENT = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_footer_content.yaml'))
REV_CUSTOMER_CARE_PAGES_CONTENT = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_customer_care_pages_content.yaml'))

def rev_get_home_page_content
  REV_HOME_PAGE_CONTENT
end

def rev_get_header_elements
  REV_HEADER_ELEMENTS['header_elements']
end

def rev_get_header_content
  REV_HEADER_ELEMENTS
end

def rev_get_plp_link
  REV_TEST_DATA_LINKS['links']['clothing_plp_link']
end

def rev_get_plp_content
  REV_PRODUCT_LIST_PAGE_CONTENT
end

def rev_get_pdp_content
  REV_PRODUCT_PAGE_CONTENT
end

def rev_get_hamburger_content
  REV_HAMBURGER_MENU_CONTENT
end

def rev_get_item_parameters(item_id)
  REV_TEST_ITEMS[item_id]
end

def rev_get_account_page_content
  REV_ACCOUNT_PAGE_CONTENT
end

def rev_get_sign_in_page_content
  REV_SIGN_IN_PAGE_CONTENT
end

def rev_get_cart_page_content
  REV_CART_PAGE_CONTENT
end

def rev_get_checkout_page_content
  REV_CHECKOUT_PAGE_CONTENT
end

def rev_get_footer_content
  REV_FOOTER_CONTENT
end

def rev_get_customer_care_pages_content
  REV_CUSTOMER_CARE_PAGES_CONTENT
end