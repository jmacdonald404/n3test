require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'data.csv')).first(10)
# # csv_text = "1472709477,36216864614,0,3
# # 1472722196,201103786727,0,3"
# csv = CSV.parse(csv_text, :headers => [:datetime, :user, :os, :device], :encoding => 'ISO-8859-1')
if Rails.env.development? || Rails.env.test?
  CSV.foreach('lib/seeds/data.csv').each_with_index do |row, i|
    break if i >= 100
    v = Visit.new
    v.datetime = row[0]
    v.user = row[1]
    v.os = row[2]
    v.device = row[3]
    v.save
    puts "#{v.datetime} saved"
  end
end
# if Rails.env.production?
#   puts "prod"
# end
# csv.each do |row|
#   v = Visit.new
#   v.datetime = row[:datetime]
#   v.user = row[:user]
#   v.os = row[:os]
#   v.device = row[:device]
#   v.save
# end