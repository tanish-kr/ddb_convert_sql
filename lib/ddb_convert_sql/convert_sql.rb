# encoding : utf-8
module DdbConvertSql

  ##
  # json to insert sql
  # @params [String] table_name
  # @params [Array](Hash) ddb_data
  # @params [Array]  columns
  # @return [Array] insert_sql
  def self.convert_sql(table_name,ddb_data,columns=nil)
    insert_sql = []
    if columns.nil?
      ddb_data.each do |row|
        sql = "INSERT INTO #{table_name} (#{row.keys.join(',')}) VALUES"
        insert_sql.push("#{sql} (#{get_values(row).join(',')});")
      end
    else
      sql = "INSERT INTO #{table_name} (#{columns.join(',')}) VALUES(<value>);"
      ddb_data.each do |row|
        insert_sql.push("#{sql} (#{get_values(row).join(',')});")
      end
    end
    insert_sql
  end

private_class_method
  ##
  # get ddb row values
  # @params [Hash] row
  # @return [Array] values
  def self.get_values(row)
    values = []
    row.each do |k,v|
      if v.has_key?('s')
        values.push("'#{v['s']}'")
      elsif v.has_key?('n')
        values.push(v['n'])
      end
    end
    values
  end
end
