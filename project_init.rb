# This script will create a basic file structure for new automation page. The following will be added:
# yaml file in data/NEW_PROJECT_TEST_DATA dir
# class pages in pages/NEW_PROJECT dir
# new_project_utils with yaml files references and get methods in utilities dir.
# Runnig: project_init.rb "PROJECT_TAG"
require "fileutils"

yaml_files_map = ["account_page", "cart_page", "checkout_page",
                  "footer", "hamburger_menu", "header",
                  "home_page", "product_list_page", "product_page",
                  "sign_in_page"]

def self.generate_class_name(project_prefix, default_element_name)
  name_parts = default_element_name.split('_')
  class_name = project_prefix.upcase + "_"
  name_parts.each do |part|
    class_name += part.capitalize
  end
  if not(class_name.include? 'Page')
    class_name += "Page"
  end
  class_name
end

def self.generate_class_path_name(project_prefix, default_element_name)
  if default_element_name.include? 'page'
    project_prefix.upcase + '_' + default_element_name
  else
    project_prefix.upcase + '_' + default_element_name + '_page'
  end
end

def get_class_pattern(class_name)
  %{require 'capybara/cucumber'\n\nmodule #{class_name}\n\textend Capybara::DSL\n\textend RSpec::Matchers\n\nend}
end

def generate_yaml_file_name(project_prefix, element_name)
  project_prefix.upcase + "_" + element_name + "_content"
end

def save_file(file_name)
  unless File.exists? file_name
    directories = File.dirname(file_name)
    FileUtils.mkdir_p(directories) unless File.directory?(directories)
    f = File.open(file_name, 'w')
    f.close
  end
  file_name
end

# Main
if ARGV[0]
  project_prefix = ARGV[0].upcase
  project_test_data_path = "./features/data/" + project_prefix + "_test_data" + "/"
  utils_dir_path = save_file("./features/utilities/" + project_prefix.downcase + "_utils.rb")

  utils_file = File.open(utils_dir_path, 'w')
  yaml_files_map.each do |element_name|
    p file_name = generate_yaml_file_name(project_prefix, element_name)
    p file_path = save_file(project_test_data_path + file_name + ".yaml")
    utils_file.puts(file_name.upcase + " = YAML.load_file(\"#{file_path}\")")
  end

  utils_file.puts("\n")
  yaml_files_map.each do |element_name|
    utils_file.puts("def " + project_prefix.downcase + "_get_" + element_name + "_content")
    utils_file.puts("\t" + generate_yaml_file_name(project_prefix, element_name).upcase)
    utils_file.puts("end\n\n")
  end
  utils_file.close

  yaml_files_map.each do |element_name|
    class_name = generate_class_name(project_prefix, element_name)
    class_path = "./features/pages/#{project_prefix}/" + generate_class_path_name(project_prefix, element_name) + ".rb"
    if not(File.exists?(class_path))
      save_file(class_path)
      class_file = File.open(class_path, 'w')
      class_file.puts(get_class_pattern(class_name))
      class_file.close
    end
  end
else
  p "No project label specified"
end