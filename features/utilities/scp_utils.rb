require 'yaml'

$shoecarnival_stored_information = Hash.new
SCP_ACCOUNT_PAGE_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_account_page_content.yaml")
SCP_CART_PAGE_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_cart_page_content.yaml")
SCP_CHECKOUT_PAGE_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_checkout_page_content.yaml")
SCP_FOOTER_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_footer_content.yaml")
SCP_HAMBURGER_MENU_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_hamburger_menu_content.yaml")
SCP_HEADER_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_header_content.yaml")
SCP_HOME_PAGE_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_home_page_content.yaml")
SCP_PRODUCT_LIST_PAGE_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_product_list_page_content.yaml")
SCP_PRODUCT_PAGE_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_product_page_content.yaml")
SCP_SIGN_IN_PAGE_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_sign_in_page_content.yaml")
SCP_TEST_ITEMS_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_test_items.yaml")
SCP_ALL_PAGE_CONTENT = YAML.load_file("./features/data/SCP_test_data/SCP_all_page.yaml")

def scp_get_account_page_content
SCP_ACCOUNT_PAGE_CONTENT
end

def scp_get_cart_page_content
SCP_CART_PAGE_CONTENT
end

def scp_get_checkout_page_content
SCP_CHECKOUT_PAGE_CONTENT
end

def scp_get_footer_content
SCP_FOOTER_CONTENT
end

def scp_get_hamburger_menu_content
SCP_HAMBURGER_MENU_CONTENT
end

def scp_get_header_content
SCP_HEADER_CONTENT
end

def scp_get_home_page_content
SCP_HOME_PAGE_CONTENT
end

def scp_get_product_list_page_content
SCP_PRODUCT_LIST_PAGE_CONTENT
end

def scp_get_product_page_content
SCP_PRODUCT_PAGE_CONTENT
end

def scp_get_sign_in_page_content
SCP_SIGN_IN_PAGE_CONTENT
end

def scp_get_test_items
SCP_TEST_ITEMS_CONTENT
end

def scp_get_all_page_content
  SCP_ALL_PAGE_CONTENT
end