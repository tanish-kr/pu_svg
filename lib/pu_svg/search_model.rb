# frozen_string_literal: true

module PuSvg
  ##
  # SearchModel class
  class SearchModel

    attr_accessor :selector, :selector_type, :attribute, :result

    def initialize(selector:, selector_type:, attribute:)
      @selector = selector
      @attribute = attribute
      @selector_type = selector_type
      valid_selector_type!
      valid_attribute!
    end

    private

    def valid_selector_type!
      raise ArgumentError, "selector must be xpath/css/base" unless %w[xpath css base].include?(selector_type)
    end

    def valid_attribute!
      raise ArgumentError, "attribute must be content/inner_html/inner_text/text" unless %w[content inner_html inner_text text].include?(attribute)
    end

  end
end
