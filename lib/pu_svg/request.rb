# frozen_string_literal: true

require "net/http"

module PuSvg
  ##
  # Request module
  # @description net/http used simple request
  module Request
    class RequestError < StandardError; end

    TIME_OUT = 20
    REDIRECT_LIMIT = 5

    def initialize
      @redirect_count = 0
      super
    end

    ##
    # URI parse
    # @param [String] uri
    def uri_parse(uri)
      URI.parse(uri)
    end

    ##
    # http get
    # @param [String] host
    # @param [String] path
    # @param [Hash] proxy [:host=>'host',:port=>port]
    # @param [Hash] header http header
    # @param [Hash] params
    # @return [String] response.body
    def get(uri:, params: nil, proxy: nil, header: nil)
      uri = uri_parse(uri)
      request(uri.host, uri.path, "get",
              params, uri.scheme == "https", proxy, header).body
    end

    ##
    # http request
    # @param [String] host
    # @param [String] path
    # @param [String] method get/post
    # @param [Boolean] https
    # @param [Hash] proxy [:host=>'host',:port=>port]
    # @param [Hash] header http header
    # @param [Hash] params
    # @return [Object] response
    def request(host, path = "/", method = "get", params = nil, https = false, proxy = nil, header = nil)
      query_escaped = URI.encode_www_form(params) unless params.nil?
      if !proxy.nil? && !proxy.empty?
        http = if https
                 Net::HTTP::Proxy(proxy[:host], proxy[:port]).new(host, 443)
               else
                 Net::HTTP::Proxy(proxy[:host], proxy[:port]).new(host)
               end
      elsif https
        http = Net::HTTP.new(host, 443)
        http.use_ssl = true
      else
        http = Net::HTTP.new(host)
      end
      http.read_timeout = TIME_OUT

      if !header.nil? && !header.empty?
        case method
        when "get"
          path = "#{path}?#{query_escaped}" unless query_escaped.nil?
          response = http.get(path, header)
        when "post"
          response = if !query_escaped.nil?
                       http.post(path, query_escaped, header)
                     else
                       http.post(path, nil, header)
                     end
        end
      else
        case method
        when "get"
          path = "#{path}?#{query_escaped}" unless query_escaped.nil?
          response = http.get(path)
        when "post"
          response = if !query_escaped.nil?
                       http.post(path, query_escaped)
                     else
                       http.post(path)
                     end
        end
      end

      if response.code.to_i > 500
        @redirect_count = 0
        raise RequestError,
              "Server Error! responce code = #{response.code} response = #{response.body}"
      elsif response.code.to_i >= 400 && response.code.to_i < 500
        @redirect_count = 0
        raise RequestError,
              "Not Found! responce codee = #{response.code} response = #{response.body}"
      elsif response.code.to_i >= 300 && response.code.to_i < 400
        redirect_url = URI.parse(response.header["location"])
        https = true if redirect_url.scheme == "https"
        @redirect_count += 1
        if @redirect_count > REDIRECT_LIMIT
          raise RequestError,
                "Exception Redirect Loop"
        end

        response = request(redirect_url.host, redirect_url.path, method, params,
                           https, proxy, header)
      else
        @redirect_count = 0
      end

      response
    end
  end
end
