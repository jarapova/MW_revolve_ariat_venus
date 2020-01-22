require 'yaml'

$vn_test_items_list = Hash.new
$venus_stored_information = Hash.new

VN_HAMBURGER_MENU = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_hamburger_menu.yaml'))
VN_VENUS_CARD_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_venus_card_page_content.yaml'))
VN_ABOUT_US_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_about_us_page_content.yaml'))
VN_CONTACT_US_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_contact_us_page_content.yaml'))
VN_CUSTOMER_CARE_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_customer_care_page_content.yaml'))
VN_REQUEST_CATALOG_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_request_catalog_page_content.yaml'))
VN_GIFT_CARDS_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_gift_cards_page_content.yaml'))
VN_SEARCH_MODAL_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_search_modal_page_content.yaml'))
VN_HEADER_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_header_content.yaml'))
VN_CATEGORY_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_category_page_content.yaml'))
VN_SUBCATEGORY_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_subcategory_filter_content.yaml'))
VN_SUBCATEGORY_ITEMS_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_subcategory_items_content.yaml'))
VN_SUBCATEGORY_PARAMETERS_FILTER_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_subcategory_parameters_filter_content.yaml'))
VN_TEST_ITEMS = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_test_items.yaml'))
VN_SEARCH_RESULTS_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_search_results_page_content.yaml'))
VN_FOOTER_MODAL_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_footer_modal_page_content.yaml'))
VN_PRIVACY_POLICY_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_privacy_policy_page_content.yaml'))
VN_SITEMAP_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_sitemap_page_content.yaml'))
VN_TERMS_OF_USE_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_terms_of_use_page_content.yaml'))
VN_WELCOME_BACK_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_welcome_back_page_content.yaml'))
VN_CART_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_cart_page_content.yaml'))
VN_PRODUCT_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_product_page_content.yaml'))
VN_SIGN_IN_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_sign_in_page_content.yaml'))
VN_MY_ACCOUNT_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_my_account_page_content.yaml'))
VN_CHECKOUT_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_checkout_page_content.yaml'))
VN_HOMEPAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_home_page_content.yaml'))
VN_PRODUCT_LIST_PAGE_CONTENT = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_product_list_page_content.yaml'))
VN_SPECIFIC_PAGES = YAML.load_file(File.join(__dir__, '../data/VN_test_data/VN_specific_pages.yaml'))

def vn_get_homepage_content
  VN_HOMEPAGE_CONTENT
end

def vn_get_preview_checkout_page_locators
  VN_CHECKOUT_PAGE_CONTENT['preview_checkout_page_locators']
end

def vn_get_billing_checkout_page_locators
  VN_CHECKOUT_PAGE_CONTENT['billing_checkout_page_locators']
end

def vn_get_shipping_checkout_page_locators
  VN_CHECKOUT_PAGE_CONTENT['shipping_checkout_page_locators']
end

def vn_get_guest_checkout_page_locators
  VN_CHECKOUT_PAGE_CONTENT['guest_checkout_page_locators']
end

def vn_get_sign_in_checkout_page_locators
  VN_CHECKOUT_PAGE_CONTENT['sign_in_checkout_page_locators']
end

def vn_get_product_page_locator(element_name)
  VN_PRODUCT_PAGE_CONTENT['page_locators'][element_name]
end

def vn_get_product_page_locators
  VN_PRODUCT_PAGE_CONTENT['page_locators']
end

def vn_get_product_page
  VN_PRODUCT_PAGE_CONTENT
end

def vn_get_cart_page_content
  VN_CART_PAGE_CONTENT
end

def vn_get_cart_page_locators
  VN_CART_PAGE_CONTENT['cart_page_locators']
end

def vn_get_cart_page_item_1_locators
  VN_CART_PAGE_CONTENT['item_1_locators']
end

def vn_get_empty_cart_page_locators
  VN_CART_PAGE_CONTENT['empty_cart_page_locators']
end

def vn_get_item_parameters(item_id)
  VN_TEST_ITEMS[item_id]
end

def vn_get_subcategory_items_content(subcategory_name)
  VN_SUBCATEGORY_ITEMS_CONTENT[subcategory_name]
end

def vn_get_subcategories(category_name)
  VN_SUBCATEGORY_PAGE_CONTENT[category_name]
end

def vn_get_item_parameters_filter_options(category_name)
  VN_SUBCATEGORY_PARAMETERS_FILTER_CONTENT[category_name]
end

def vn_get_category_shop_now_buttons(category_name)
  VN_CATEGORY_PAGE_CONTENT[category_name]['shop_now_buttons']
end

def vn_get_category_dropdown_text(category_name)
  VN_CATEGORY_PAGE_CONTENT[category_name]['category_dropdown_text']
end

def vn_get_main_carousel_elements(carousel_element_name)
  VN_HEADER_CONTENT['carousel_elements'][carousel_element_name]
end

def vn_get_header_content
  VN_HEADER_CONTENT
end

def vn_get_header_locators
  VN_HEADER_CONTENT['header_locators']
end

def vn_get_hamburger_page_elements(hamburger_page_name)
  VN_HAMBURGER_MENU[hamburger_page_name]
end

def vn_get_venus_card_page_locators
  VN_VENUS_CARD_PAGE_CONTENT['content_locators']
end

def vn_get_venus_card_page_text
  VN_VENUS_CARD_PAGE_CONTENT['content_text']
end

def vn_get_about_us_page_text
  VN_ABOUT_US_PAGE_CONTENT['content_text']
end

def vn_get_about_us_page_locators
  VN_ABOUT_US_PAGE_CONTENT['content_locators']
end

def vn_get_contact_us_page_text
  VN_CONTACT_US_PAGE_CONTENT['content_text']
end

def vn_get_contact_us_page_locators
  VN_CONTACT_US_PAGE_CONTENT['content_locators']
end

def vn_get_customer_care_page_locators
  VN_CUSTOMER_CARE_PAGE_CONTENT['content_locators']
end


def vn_get_request_catalog_page_text
  VN_REQUEST_CATALOG_PAGE_CONTENT['content_text']
end

def vn_get_request_catalog_page_locators
  VN_REQUEST_CATALOG_PAGE_CONTENT['content_locators']
end

def vn_get_gift_cards_page_text
  VN_GIFT_CARDS_PAGE_CONTENT['content_text']
end

def vn_get_gift_cards_page_locators
  VN_GIFT_CARDS_PAGE_CONTENT['content_locators']
end

def vn_get_search_modal_page_text
  VN_SEARCH_MODAL_PAGE_CONTENT['content_text']
end

def vn_get_search_modal_page_locators
  VN_SEARCH_MODAL_PAGE_CONTENT['content_locators']
end

def vn_get_search_results_page_text
  VN_SEARCH_RESULTS_PAGE_CONTENT['content_text']
end

def vn_get_search_results_page_locators
  VN_SEARCH_RESULTS_PAGE_CONTENT['content_locators']
end

def vn_get_footer_modal_page_text
  VN_FOOTER_MODAL_PAGE_CONTENT['content_text']
end

def vn_get_footer_modal_page_locators
  VN_FOOTER_MODAL_PAGE_CONTENT['content_locators']
end

def vn_get_welcome_back_page_locators
  VN_WELCOME_BACK_PAGE_CONTENT['content_locators']
end

def vn_get_terms_of_use_page_locators
  VN_TERMS_OF_USE_PAGE_CONTENT['content_locators']
end

def vn_get_sitemap_page_locators
  VN_SITEMAP_PAGE_CONTENT['content_locators']
end

def vn_get_privacy_policy_page_locators
  VN_PRIVACY_POLICY_PAGE_CONTENT['content_locators']
end

def vn_get_sign_in_page_locators
  VN_SIGN_IN_PAGE_CONTENT['content_locators']
end

def vn_get_forgot_password_modal_locators
  VN_SIGN_IN_PAGE_CONTENT['forgot_password_modal_locators']
end

def vn_get_account_information_page_locators
  VN_MY_ACCOUNT_PAGE_CONTENT['account_information_page']
end

def vn_get_account_options_modal_elements
  VN_HEADER_CONTENT['account_options_modal_elements']
end

def vn_get_order_history_page_locators
  VN_MY_ACCOUNT_PAGE_CONTENT['order_history_page']
end

def vn_get_wish_list_locators
  VN_MY_ACCOUNT_PAGE_CONTENT['wish_list_page']
end

def vn_get_account_navigation_tab_locators
  VN_MY_ACCOUNT_PAGE_CONTENT['account_tabs']
end

def vn_get_order_mail_options_page_locators
  VN_MY_ACCOUNT_PAGE_CONTENT['mail_options_page']
end

def vn_get_account_welcome_back_page_locators
  VN_MY_ACCOUNT_PAGE_CONTENT['welcome_back_account_page_locators']
end

def vn_get_product_list_page_content
  VN_PRODUCT_LIST_PAGE_CONTENT
end

def vn_get_specific_pages
  VN_SPECIFIC_PAGES
end