require 'sanitize_html_fields/version'
require 'sanitize_html_fields/sanitize_html_fields'

module SanitizeHtmlFields
end

ActiveRecord::Base.send(:include, SanitizeHtmlFields)
