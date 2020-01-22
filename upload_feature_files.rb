# frozen_string_literal: true
# Ruby1
require 'uri'
require 'net/http'
require 'bundler/setup'
require 'json'
require 'gherkin/parser'
require 'gherkin/pickles/compiler'
require 'open3'
require 'pp'


# Hiptest application base url
$base_url = 'https://app.hiptest.com'

# Hiptest `project id` with name `PWA Baseline from API` and `root folder id` with name `Baseline features`
#$project_id = 146953
$project_id = 138166
#$root_folder_id = 1089646
$root_folder_id = 1003843

# API auth information
$access_token = 'j8_5QGi3rvwBxMaeQtOeOw'
$uid = 'eugene.shapovalov@moovweb.com'
$client = 'dmP84m3gslOeJ6ZhBiu1Vg'

# root local folder with features files
$dir_target = 'features/regression/Baseline features'

# Count features per build
$all_features_count = 0

# Success `count` and `list` features per build
$success_uploaded_count = 0
$uploaded_features_list = Array.new

# Fail `count` and `list` features per build
$fail_uploaded_count = 0
$not_uploaded_features_list = Array.new

# Deleted `count` features per build
$deleted_count = 0
$updated_count = 0
$created_count = 0

# Main
def create_features_from_scratch
  # remove all features and scenario from hiptest
  delete_features_from_hiptest

  # get all folders and sub-folders from destination path
  dirs = Dir.glob("#{$dir_target}/**/*")

  dirs.each do |folder|
    if File.directory?(folder)

      folder_name = get_name_feature_from_path(folder)
      puts "\nSend features from folder: #{folder_name}"

      # create folder on hiptest
      folder_id = new_folder_request(folder_name)

      # send features
      send_features(folder_id, folder_name)
    end
  end
end

def remove_nonexistent_features
  # Get children folders of root folder from HipTest
  children_folders_of_root = get_children_folders $root_folder_id

  puts "\n"
  puts "Start removing..."
  puts "\n"

  # Iterate folders from HipTest and find features on local changes
  children_folders_of_root.each do |root_subfolder|
    features_content = read_features_form_folder root_subfolder['attributes']['name']
    features_from_hiptest = get_children_folders root_subfolder['id']

    puts "Check '#{root_subfolder['attributes']['name']}' folder..."
    puts "HipTest: #{features_from_hiptest.count} | Local: #{features_content.count}"

    features_from_hiptest.each do |feature_hiptest|
      removed = true

      features_content.each do |file, feature|
        if get_name_feature_from_file(feature) == feature_hiptest['attributes']['name']
          removed = false
        end
      end

      if removed
        delete_folder_request feature_hiptest['id']
        puts "Feature: '#{feature_hiptest['attributes']['name']}' removed."
      end
    end
    puts "\n"
  end
end

def update_changed_features
  # Get list changed files [folder|path]
  updated_features_path = get_changed_file_list

  # Get children folders of root folder from HipTest
  children_folders_of_root = get_children_folders $root_folder_id

  puts "\n"
  # Output base inform about update
  puts "Found #{updated_features_path.count} features to update"
  puts "\n"

  features_name_list = get_features_name updated_features_path
  puts "******************************"
  puts "Features to update:"
  features_name_list.each do |file_name, feature_name|
    puts "Found [#{file_name}] file. Feature name [#{feature_name}]"
  end
  puts "******************************"
  puts "\n"

  puts "Start updating..."
  puts "\n"

  # Iterate folders from HipTest and find features on local changes
  children_folders_of_root.each do |root_subfolder|
    # Set to false. If true - features need to add not update
    feature_file_name = ''
    features_from_hiptest = get_children_folders root_subfolder['id']

    updated_features_path.each do |folder, feature_path|
      updated = false
      feature_name = get_name_feature_from_file(read_feature_by_path(feature_path))
      feature_content = read_feature_by_path(feature_path)
      if root_subfolder['attributes']['name'] == folder
        features_from_hiptest.each do |folder|
          feature_file_name = features_name_list.each { |k, v| break k if v == feature_name }
          if feature_name == folder['attributes']['name']
            puts "[Update] feature '#{folder['attributes']['name']}' from file '#{feature_file_name}'"
            update_feature_request folder['id'], feature_content, feature_file_name
            updated = true
          end
        end
        unless updated
          puts "[Create] feature '#{feature_name}' from file '#{feature_file_name}'."
          new_feature_request root_subfolder['id'], feature_content, feature_file_name
        end
      end
    end
  end

end


def update_features

  # Get children folders of root folder
  children_folders_of_root = get_children_folders $root_folder_id
  puts "Found #{children_folders_of_root.count} folders in root folder - HipTest"

  children_folders_of_root.each do |folder|
    puts folder['attributes']['name']
  end
  puts "\n"

  puts "Start updating..."

  children_folders_of_root.each do |root_subfolder|
    puts "\n"
    features_content = read_features_form_folder root_subfolder['attributes']['name']
    features_from_hiptest = get_children_folders root_subfolder['id']
    puts "Found #{features_from_hiptest.count} features files in '#{root_subfolder['attributes']['name']}' folder - HipTest"
    puts "***** #{features_from_hiptest.count} features to update. | #{features_content.count - features_from_hiptest.count} to add. *****"

    features_content.each do |file, feature|
      updated = false

      features_from_hiptest.each do |folder|
        if get_name_feature_from_file(feature) == folder['attributes']['name']
          update_feature_request folder['id'], feature, file
          updated = true
        else
        end
      end
      unless updated
        new_feature_request root_subfolder['id'], feature, file
        puts "Feature '#{file}' added"
      end
    end
    puts "**********"
  end
end

# local functions

# Get modified files from last push
def get_changed_file_list
  command = "git log -m -1 --name-only --pretty='format:' $(git rev-parse origin/master)"
  file_paths = []
  features = {}
  features.compare_by_identity

  Open3.popen3(command) do |stdin, stdout, stderr|
    files = stdout.read.gsub! "\n", ","
    file_paths = files.split(",")
    puts "Found files:\n#{file_paths}"
  end

  puts "Count files in push: #{file_paths.count}"

  file_paths.each do |file_path|
    if file_path.include?(".feature")
      puts "Added: #{file_path}"
      folder = get_name_folder_from_path file_path
      features.store(folder, file_path)
    end
  end

  puts "\n"
  puts "Count feature files: #{features.count}"
  features.sort
end

# Get name feature from file use Gherkin Parser
def get_name_feature_from_file(content)
  parser = Gherkin::Parser.new
  gherkin_document = parser.parse(content)
  gherkin_document[:feature][:name]
end

# Remove all features files from Hiptest
def delete_features_from_hiptest
  puts "\nStart deleting..."
  children_folders_of_root = get_children_folders $root_folder_id

  # Delete features from root subfolders
  children_folders_of_root.each do |folder|
    status = delete_folder_children_request folder['id']

    if status == 200.to_s
      puts "Features from '#{folder['attributes']['name']}' folder deleted."
    end
  end

  # Delete folders from root subfolder
  status = delete_folder_children_request $root_folder_id

  if status == 200.to_s
    puts "Folders from root folder deleted."
  end
end

# Read features content
def read_features_form_folder(folder_name)
  feature__files_list = Dir.glob("#{$dir_target}/#{folder_name}/*.feature")

  # hash map
  hash_features = Hash.new

  feature__files_list.each do |file|
    if !File.directory?(file)
      feature_content = read_feature_by_path(file)
      file_name = get_name_feature_from_path(file)
      hash_features.store(file_name, feature_content)
    end
  end
  hash_features
end

def read_features_form_folder_by_path(features_path)
  #puts "Found #{feature__files_list.count} features files in '#{folder_name}' folder - Local"

  # hash map
  hash_features = Hash.new

  features_list_paths.each do |file|
    if !File.directory?(file)
      feature_content = read_feature_by_path(file)
      file_name = get_name_feature_from_path(file)
      hash_features.store(file_name, feature_content)
    end
  end
  hash_features
end

# Send features to Hiptest
def send_features(folder_id, folder_name)
  # get all features files from folder
  feature_list = Dir.glob("#{$dir_target}/#{folder_name}/*.feature")
  puts "Count features to upload: #{feature_list.count}"

  # Send features to HipTest
  feature_list.each do |file|
    if !File.directory?(file)
      file_name = get_name_feature_from_path(file)
      feature_content = read_feature_by_path(file)
      new_feature_request(folder_id, feature_content, file_name)
      puts "Send new feature: #{file_name}"
      sleep 2
    end
  end
end

def get_features_name(features)
  # hash map
  features_name = Hash.new

  features.each do |folder, path|
    feature_file_name = get_name_feature_from_path(path)
    feature_content = read_feature_by_path(path)
    feature_name = get_name_feature_from_file(feature_content)
    features_name.store(feature_file_name, feature_name)
  end

  features_name
end

# Get name file from path
def get_name_feature_from_path(path)
  folder_path_array = path.split('/')
  folder_path_array[folder_path_array.count - 1]
end

# Get name file from path
def get_name_folder_from_path(path)
  folder_path_array = path.split('/')
  folder_path_array[folder_path_array.count - 2]
end


# Read feature from file
def read_feature_by_path(feature_file_name)
  file = File.open(feature_file_name)
  file_data = file.read
  file_data
end

# Print `name` of files, `status code`
def print_stat
  puts "\n"
  puts "********************"
  puts "Statistics:"

  puts "\n"
  puts "Failed: #{$fail_uploaded_count}"
  $not_uploaded_features_list.each do |feature|
    puts feature
  end

  puts "\n"
  puts "Success: #{$success_uploaded_count}"
  $uploaded_features_list.each do |feature|
    puts feature
  end
  puts "********************"

  File.write('result.log', "#{$updated_count},#{$created_count},#{$deleted_count}")
end


# requests
# Send request to Hiptest with delete all children from folder
def delete_folder_children_request(folder_id)
  url = URI("#{$base_url}/api/projects/#{$project_id}/folders/#{folder_id}/children")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Delete.new(url)
  request["accept"] = 'application/vnd.api+json; version=1'
  request["access-token"] = $access_token
  request["uid"] = $uid
  request["client"] = $client
  response = http.request(request)

  if response.code == 304.to_s
    puts "Folder is empty. Status: #{response.code}"
  elsif response.code == 504.to_s
    puts "Gateway Time-out. Status: #{response.code}"
    puts response.body
  end

  response.code
end

# requests
# Send request to Hiptest with delete all children from folder
def delete_folder_request(folder_id)
  url = URI("#{$base_url}/api/projects/#{$project_id}/folders/#{folder_id}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Delete.new(url)
  request["accept"] = 'application/vnd.api+json; version=1'
  request["access-token"] = $access_token
  request["uid"] = $uid
  request["client"] = $client
  response = http.request(request)

  if response.code == 200.to_s
    $deleted_count = $deleted_count + 1
  elsif response.code == 304.to_s
    puts "Folder is empty. Status: #{response.code}"
  elsif response.code == 504.to_s
    puts "Gateway Time-out. Status: #{response.code}"
    puts response.body
  end

  response.code
end

# Get list folders from Hiptest
def get_children_folders(folder_id)
  url = URI("#{$base_url}/api/projects/#{$project_id}/folders/#{folder_id}/children")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/vnd.api+json; version=1'
  request["access-token"] = $access_token
  request["uid"] = $uid
  request["client"] = $client
  response = http.request(request)

  folders_json = ''

  if response.code == 200.to_s
    folders_json = JSON.parse(response.read_body)['data']
  else
    puts "Problem with getting folders. Status: #{response.code}"
    puts response.body
  end
  folders_json
end

# Send request to Hiptest with new folder
def new_folder_request(dir_name)
  url = URI("#{$base_url}/api/projects/#{$project_id}/folders")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Post.new(url)
  request["accept"] = 'application/vnd.api+json; version=1'
  request["access-token"] = $access_token
  request["uid"] = $uid
  request["client"] = $client
  request["Content-Type"] = 'application/json'

  data = {
      data: {
          attributes: {
              "name": dir_name,
              "parent-id": $root_folder_id
          }
      }
  }

  request.body = JSON.generate(data)
  response = http.request(request)

  id = ''

  if response.code == 422.to_s
    id = JSON.parse(response.read_body)['existing_folder_id']
    puts "Folder already exist. id: #{id}"
  elsif response.code == 201.to_s
    id = JSON.parse(response.read_body)['data']['id']
    puts "Folder created. id: #{id}"
  end

  id
end

# Send request to Hiptest with new feature file
def new_feature_request(folder_id, feature_content, file_name)
  url = URI("#{$base_url}/api/projects/#{$project_id}/folders/#{folder_id}/create_from_feature")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Post.new(url)
  request["accept"] = 'application/vnd.api+json; version=1'
  request["access-token"] = $access_token
  request["uid"] = $uid
  request["client"] = $client
  request["Content-Type"] = 'application/json'

  data = {
      data: {
          attributes: {
              "feature": feature_content
          }
      }
  }

  request.body = JSON.generate(data)
  response = http.request(request)

  if response.code == 200.to_s
    $created_count = $created_count + 1
    $success_uploaded_count = $success_uploaded_count + 1
    $uploaded_features_list.push(file_name)
    puts "Feature '#{get_name_feature_from_file(feature_content)}' created."
  else
    $fail_uploaded_count = $fail_uploaded_count + 1
    $not_uploaded_features_list.push(file_name)
  end

  response.code
end

# Send request to Hiptest with updated feature file
def update_feature_request(folder_id, feature_content, file_name)
  url = URI("#{$base_url}/api/projects/#{$project_id}/folders/#{folder_id}/update_from_feature")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Patch.new(url)
  request["accept"] = 'application/vnd.api+json; version=1'
  request["access-token"] = $access_token
  request["uid"] = $uid
  request["client"] = $client
  request["Content-Type"] = 'application/json'

  data = {
      data: {
          attributes: {
              "feature": feature_content
          }
      }
  }

  request.body = JSON.generate(data)
  response = http.request(request)

  if response.code == 200.to_s
    update_response = JSON.parse(response.read_body)['data']
    puts "Feature '#{update_response['attributes']['name']}' with '#{update_response['attributes']['scenarios-count']} scenario(s)' updated."
    $success_uploaded_count = $success_uploaded_count + 1
    $uploaded_features_list.push(file_name)
    $updated_count = $updated_count + 1
  else
    $fail_uploaded_count = $fail_uploaded_count + 1
    $not_uploaded_features_list.push(file_name)
  end

  response.code
end


if ARGV[0].include? "create-features"
  puts "Create features..."
  create_features_from_scratch
  print_stat
elsif ARGV[0].include? "update-features"
  puts "Update changed features..."
  update_changed_features
  puts "\n"
  puts "Remove nonexistent features..."
  remove_nonexistent_features
  print_stat
elsif ARGV[0].include? "update-all-features"
  puts "Update all features..."
  update_features
  puts "Remove nonexistent features..."
  remove_nonexistent_features
  print_stat
elsif ARGV[0].include? "clear-hiptest"
  puts "Remove nonexistent features..."
  remove_nonexistent_features
end

