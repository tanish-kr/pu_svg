# frozen_string_literal: true

require "pu_svg/request"
require "pu_svg/encoder"

module PuSvg
  ##
  # PlantUML converter
  class Convert

    PLANTUML_SERVER_URL = "http://www.plantuml.com/plantuml"

    include Request

    class << self

      def run(plantuml_text)
        encoded = Encoder.encode(plantuml_text)
        get("#{PLANTUML_SERVER_URL}/svg/#{encoded}")
      end

    end

  end
end
