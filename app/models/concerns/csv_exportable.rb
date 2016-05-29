require 'csv'
module CsvExportable
  extend ActiveSupport::Concern

  module ClassMethod
    def to_csv(header: column_names, columns: column_names, row_sep: "\r\n", encoding: ENCODING::CP932)
      records = CSV.generate(row_sep: row_sep) do |csv|
        csv << header
        all.each { |record| csv << record.attributes.values_at(*columns) }
      end
      records.encode(encoding, invalid: :replace, undef: :replace)
    end
  end
end
