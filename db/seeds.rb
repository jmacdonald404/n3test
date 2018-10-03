require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'data.csv'))
csv_text = "1472709477,36216864614,0,3
1472722196,201103786727,0,3"
csv = CSV.parse(csv_text, :headers => [:datetime, :user, :os, :device], :encoding => 'ISO-8859-1')
# puts csv
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  # puts Time.at(row[:datetime].to_i)
  # puts row[:datetime]
  v = Visit.new
  v.datetime = row[:datetime]
  v.user = row[:user]
  v.os = row[:os]
  v.device = row[:device]
  v.save
  puts "#{v.datetime} saved"
end