require 'csv'

# if Rails.env.development? || Rails.env.test?
#   CSV.foreach('lib/seeds/data.csv').each_with_index do |row, i|
#     break if i >= 100
#     v = Visit.new
#     v.datetime = row[0]
#     v.user = row[1]
#     v.os = row[2]
#     v.device = row[3]
#     v.save
#     puts "#{v.datetime} saved"
#   end
# end
# if Rails.env.production?
#   CSV.foreach('lib/seeds/data.csv').each do |row|
#     v = Visit.new
#     v.datetime = row[0]
#     v.user = row[1]
#     v.os = row[2]
#     v.device = row[3]
#     v.save
#   end
#   puts "dataset seeded"
# end


# This adds headers to data every time you seed watch out
# csv_file = 'lib/seeds/data.csv'
# CSV.open(csv_file + '.tmp', 'w', write_headers: true, headers: ["user","datetime","os","device"]) do |dest|
# # Transpose original data
#   CSV.open(csv_file) do |source|
#     source.each do |row|
#       dest << row
#     end
#   end
# end
#
# # # Swap new version for old
# File.rename(csv_file + '.tmp', csv_file)

# sql = "COPY visits(user,datetime,os,device) FROM '#{Rails.root}/lib/seeds/smalldata.csv' (format csv, header, delimiter ',', null ' ')"
# sql = "COPY visits FROM '#{Rails.root}/lib/seeds/smalldata.csv' WITH (FORMAT text, DELIMITER ',',  NULL ' ', header)"
# ActiveRecord::Base.connection.execute sql
# # COPY cases FROM 'path/to/file.csv' WITH (FORMAT csv, DELIMITER ',',  NULL ' ', HEADERS true)
Visit.copy_from "lib/seeds/data.csv"