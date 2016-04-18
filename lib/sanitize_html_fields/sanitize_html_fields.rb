module SanitizeHtmlFields

  def self.included(base)
    base.extend ActionView::Helpers::SanitizeHelper::ClassMethods
    base.send :include, ActionView::Helpers::SanitizeHelper
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def sanitize_html_fields(options = {})
      send :include, InstanceMethods
      send :before_save, :convert_html_fields

      cattr_accessor :shf_convert_newlines
      self.shf_convert_newlines = options.delete(:convert_newlines) || false

      cattr_accessor :shf_remove_excessive_whitespaces
      self.shf_remove_excessive_whitespaces = options.delete(:remove_excessive_whitespaces) || true

      cattr_accessor :shf_options
      self.shf_options = options
    end
  end

  module InstanceMethods
    include ActionView::Helpers::SanitizeHelper
    include SanitizeHtmlFields::ClassMethods

    def convert_html_fields
      options = self.class.shf_options
      self.class.content_columns.each do |c|
        if self.respond_to?("#{c.name}_html") && !self.send("#{c.name}").nil?

          sanitized_html = sanitize(self.send("#{c.name}"), options)
          sanitized_html.gsub!(/[\s\n\r\t]+\Z/, '') if self.class.shf_remove_excessive_whitespaces
          sanitized_html.gsub!("\n", '<br />') if self.class.shf_convert_newlines

          self.send("#{c.name}_html=", sanitized_html)
        end
      end
    end
  end
end
