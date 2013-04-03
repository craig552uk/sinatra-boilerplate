#encoding: utf-8

#
# A helper class for working with mime types
#
class MimeType

  def initialize(opts={:ext => nil, :mime => nil})
    raise ArgumentError, 'Requires @ext or @mime' if opts[:ext].nil? && opts[:mime].nil?
    @mime_type = types.select{ |t| t[:ext]  == opts[:ext]}.first  unless opts[:ext].nil?
    @mime_type = types.select{ |t| t[:mime] == opts[:mime]}.first unless opts[:mime].nil?
    raise StandardError, 'MimeType unrecognised' if @mime_type.nil?
  end

  def mime
    @mime_type[:mime]
  end

  def ext
    @mime_type[:ext]
  end

  def desc
    @mime_type[:desc]
  end

  alias_method :extension,   :ext
  alias_method :description, :desc
  alias_method :mimetype,    :mime
  alias_method :inspect,     :mime

  private

  # Type definitions
  def types
    [{:ext => 'txt', :desc => 'Plain Text', :mime => 'text/plain'},
     {:ext => 'csv', :desc => 'CSV',        :mime => 'text/csv'},
     {:ext => 'tsv', :desc => 'TSV',        :mime => 'text/tab-separated-values'},
     {:ext => 'xml', :desc => 'XML',        :mime => 'application/xml'},
     {:ext => 'rdf', :desc => 'RDF XML',    :mime => 'application/rdf+xml'},
     {:ext => 'ttl', :desc => 'RDF Turtle', :mime => 'text/turtle'}]
  end
end