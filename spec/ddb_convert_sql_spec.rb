require 'spec_helper'

describe DdbConvertSql do
  it 'convert datapipeline save data to json' do
    file_path = File.expand_path('../fixtures/sample_data',__FILE__)
    ddb_data =  DdbConvertSql.convert_json(file_path)
    puts ddb_data
    expect(ddb_data.count).to be > 0
    sql = DdbConvertSql.convert_sql('sample_tb',ddb_data)
    puts sql
    expect(sql.count).to be > 0
    expect(sql.to_s).to match(/INSERT/)
  end
end
