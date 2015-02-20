# encoding : utf-8
module DdbConvertSql

  ##
  # DynamoDB Export Data Convert JSON
  # @params [String] file_path
  # @return [Array] json_data
  def self.convert_json(file_path)
    str = File.read(file_path)
    JSON.parse("[#{str.gsub(/$/,'}').gsub(/\x02/,',"').gsub(/\x03/,'":').gsub(/^/,'{"').gsub(/$/,',').gsub(/,\z/,']')}")
  end

end
