# The MIT License (MIT)
# Copyright (c) 2015 Marek Aufart, edesky.cz
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

require 'net/http'
require 'xmlsimple'

class EdeskyClient

  CLIENT_DEFAULTS = {
    endpoint_url: 'https://edesky.cz/api/v1/',
    api_key: ''
  }

  DOC_QUERY_DEFAULTS = {
    keywords: '*',
    include_texts: 0
  }

  BOARD_QUERY_DEFAULTS = {}

  def initialize(options = {})
    CLIENT_DEFAULTS.merge(options).each do |option, value|
      instance_variable_set("@#{option}", value)
    end
  end

  def query_documents(options = {})
    fetch('documents', DOC_QUERY_DEFAULTS.merge(options))
  end

  def query_dashboards(options = {})
    raise "Not implemented yet!"
  end

  private

  def fetch(type, params)
    uri = URI(URI.join(@endpoint_url, type))
    uri.query = URI.encode_www_form(params)
    XmlSimple.xml_in(Net::HTTP.get(uri), 'ForceArray': false)
  end

end

=begin
# Example:
client = EdeskyClient.new(api_key: '')
response = client.query_documents(keywords: 'prodej')
# print first found document
p response['documents']['document'][0]
=end
