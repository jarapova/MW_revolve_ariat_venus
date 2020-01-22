$ari_stored_information = Hash.new
ARI_ACCOUNT_PAGE_CONTENT = YAML.load_file("./features/data/ARI_test_data/ARI_account_page_content.yaml")
ARI_CART_PAGE_CONTENT = YAML.load_file("./features/data/ARI_test_data/ARI_cart_page_content.yaml")
ARI_CHECKOUT_PAGE_CONTENT = YAML.load_file("./features/data/ARI_test_data/ARI_checkout_page_content.yaml")
ARI_FOOTER_CONTENT = YAML.load_file("./features/data/ARI_test_data/ARI_footer_content.yaml")
ARI_HAMBURGER_MENU_CONTENT = YAML.load_file("./features/data/ARI_test_data/ARI_hamburger_menu_content.yaml")
ARI_HEADER_CONTENT = YAML.load_file("./features/data/ARI_test_data/ARI_header_content.yaml")
ARI_HOME_PAGE_CONTENT = YAML.load_file("./features/data/ARI_test_data/ARI_home_page_content.yaml")
ARI_PRODUCT_LIST_PAGE_CONTENT = YAML.load_file("./features/data/ARI_test_data/ARI_product_list_page_content.yaml")
ARI_PRODUCT_PAGE_CONTENT = YAML.load_file("./features/data/ARI_test_data/ARI_product_page_content.yaml")
ARI_SIGN_IN_PAGE_CONTENT = YAML.load_file("./features/data/ARI_test_data/ARI_sign_in_page_content.yaml")
ARI_TEST_ITEMS = YAML.load_file("./features/data/ARI_test_data/ARI_test_items.yaml")

def ari_get_account_page_content
ARI_ACCOUNT_PAGE_CONTENT
end

def ari_get_cart_page_content
ARI_CART_PAGE_CONTENT
end

def ari_get_checkout_page_content
ARI_CHECKOUT_PAGE_CONTENT
end

def ari_get_footer_content
ARI_FOOTER_CONTENT
end

def ari_get_hamburger_menu_content
ARI_HAMBURGER_MENU_CONTENT
end

def ari_get_header_content
ARI_HEADER_CONTENT
end

def ari_get_home_page_content
ARI_HOME_PAGE_CONTENT
end

def ari_get_product_list_page_content
ARI_PRODUCT_LIST_PAGE_CONTENT
end

def ari_get_product_page_content
ARI_PRODUCT_PAGE_CONTENT
end

def ari_get_sign_in_page_content
ARI_SIGN_IN_PAGE_CONTENT
end

def ari_get_test_items(item_id)
  ARI_TEST_ITEMS[item_id]
end

