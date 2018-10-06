require 'csv'

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
if Rails.env.production?
  CSV.foreach('lib/seeds/data.csv').each do |row|
    v = Visit.new
    v.datetime = row[0]
    v.user = row[1]
    v.os = row[2]
    v.device = row[3]
    v.save
  end
end