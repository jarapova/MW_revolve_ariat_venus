require 'nokogiri'
require 'mail'

EMAILS = YAML.load_file(File.join(__dir__, '../data/email_broadcast.yaml'))

def get_emails(mail_list_name)
  EMAILS['emails'][mail_list_name]
end

# SMTP parameters for establishing connection with Google smtp server
def get_smtp_parameters
  smtp = {
      address: 'smtp.gmail.com',
      port: 587,
      domain: 'softesis.com',
      user_name: 'smith@softesis.com',
      password: ENV['temp_email_password'],
      authentication: 'plain',
      enable_starttls_auto: true
  }
end

Mail.defaults {delivery_method :smtp, get_smtp_parameters}

# This method will add necessary information to html template
def get_api_test_html_template(view_build_link)
  file = File.read('features/data/email_template_api_test.html')
  email_template = Nokogiri::HTML.fragment(file)
  email_template.at_css("#circleci")['href'] = view_build_link
  email_template.at_css("#json_1")['href'] = get_item_entries_link(API_LOG_PATH)
  email_template.to_html
end

# This method will add necessary information to html template
def get_html_template(passed, failed, env, view_build_link, view_allure_link)
  file = File.read('features/data/email_template_test_result.html')
  email_template = Nokogiri::HTML.fragment(file)
  email_template.at_css('#passed').content += passed.to_s
  email_template.at_css('#failed').content += failed.to_s
  email_template.at_css('#env').content += env
  email_template.at_css("#circleci")['href'] = view_build_link
  email_template.at_css("#allure")['href'] = view_allure_link
  email_template.to_html
end

# This method will add necessary information to html template
def get_features_update_html_template(failed_count, failed_list, passed_count, passed_list, view_build_link, project_id)
  file = File.read('features/data/email_template_features.html')
  email_template = Nokogiri::HTML.fragment(file)
  email_template.at_css('#failed').content += failed_count.to_s
  email_template.at_css('#failed_list').add_child(failed_list.to_s)
  email_template.at_css('#passed').content += passed_count.to_s
  email_template.at_css('#passed_list').add_child(passed_list.to_s)

  email_template.at_css("#hiptest")['href'] = "https://app.hiptest.com/projects/#{project_id}"
  email_template.at_css("#circleci")['href'] = view_build_link

  email_template.to_html
end

# Current host for broadcast is eugene.shapovalov@moovweb.com
def send_email_message(recipient, subject_str, body_html)
  mail = Mail.new do
    from 'eugene.shapovalov@moovweb.com'
    to recipient
    subject subject_str
    html_part do
      content_type 'text/html; charset=UTF-8'
      body body_html
    end
  end
  mail.deliver!
  p "Message delivered to: #{recipient}"
end

#Method for generating unique link for allure report
def get_allure_build_link
  begin
    return "https://" + ENV['CIRCLE_BUILD_NUM'] + "-165707333-gh.circle-artifacts.com/0/home/circleci/mw-automation-framework/gen/allure_html/index.html"
  rescue Exception
    p "CIRCLE_BUILD_NUM variable does not exist"
    return "Http link error"
  end
end

def get_item_entries_link(file)
  begin
    return "https://" + ENV['CIRCLE_BUILD_NUM'] + "-165707333-gh.circle-artifacts.com/0/home/circleci/mw-automation-framework/#{file}"
  rescue Exception
    p "CIRCLE_BUILD_NUM variable does not exist"
    return "Http link error"
  end
end

