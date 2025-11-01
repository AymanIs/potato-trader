# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Nettoyage des anciennes données..."
PotatoPrice.destroy_all
# 3 different price movement days
puts "Création des prix de pommes de terre..."
# Here we create 3 days with different gain patterns



#Day 1 A profitable day with a clear upward trend. Prices rise steadily allowing for a big potential gain.
date1 = Date.new(2025, 11, 15)
base_time1 = date1.to_time.change(hour: 9, min: 0)

prices_day1 = [
  { time: base_time1, price: 98.50 },                    
  { time: base_time1 + 40.minutes, price: 97.80 },       
  { time: base_time1 + 1.5.hours, price: 99.20 },      
  { time: base_time1 + 2.hours, price: 100.15 },       
  { time: base_time1 + 3.hours, price: 101.50 },         
  { time: base_time1 + 4.hours, price: 100.80 },         
  { time: base_time1 + 5.hours, price: 102.45 },         
  { time: base_time1 + 5.5.hours, price: 103.25 },       
  { time: base_time1 + 6.hours, price: 102.90 },         
  { time: base_time1 + 6.5.hours, price: 101.75 },       
  { time: base_time1 + 7.hours, price: 101.20 },         
  { time: base_time1 + 8.hours, price: 100.95 }          
]

prices_day1.each do |data|
  PotatoPrice.create!(
    recorded_at: data[:time],
    price: data[:price]
  )
end
#day 2 shows a lot of price fluctuations.
date2 = Date.new(2025, 11, 16)
base_time2 = date2.to_time.change(hour: 9, min: 0)

prices_day2 = [
  { time: base_time2, price: 101.00 },
  { time: base_time2 + 45.minutes, price: 99.50 },      
  { time: base_time2 + 1.5.hours, price: 103.80 },      
  { time: base_time2 + 2.hours, price: 102.20 },
  { time: base_time2 + 3.hours, price: 98.75 },         
  { time: base_time2 + 4.hours, price: 100.50 },
  { time: base_time2 + 5.hours, price: 104.90 },        
  { time: base_time2 + 5.5.hours, price: 103.60 },
  { time: base_time2 + 6.hours, price: 102.85 },
  { time: base_time2 + 6.5.hours, price: 101.40 },
  { time: base_time2 + 7.hours, price: 100.30 },
  { time: base_time2 + 8.hours, price: 99.80 }
]

prices_day2.each do |data|
  PotatoPrice.create!(
    recorded_at: data[:time],
    price: data[:price]
  )
end

#day 3  a stable day with minimal price movement
date3 = Date.new(2025, 11, 17)
base_time3 = date3.to_time.change(hour: 9, min: 0)

prices_day3 = [
  { time: base_time3, price: 100.00 },
  { time: base_time3 + 40.minutes, price: 100.15 },
  { time: base_time3 + 1.5.hours, price: 100.30 },
  { time: base_time3 + 2.hours, price: 100.10 },
  { time: base_time3 + 3.hours, price: 100.25 },
  { time: base_time3 + 4.hours, price: 100.40 },
  { time: base_time3 + 5.hours, price: 100.55 },       
  { time: base_time3 + 5.5.hours, price: 100.45 },
  { time: base_time3 + 6.hours, price: 100.30 },
  { time: base_time3 + 6.5.hours, price: 100.20 },
  { time: base_time3 + 7.hours, price: 100.15 },
  { time: base_time3 + 8.hours, price: 100.05 }
]

prices_day3.each do |data|
  PotatoPrice.create!(
    recorded_at: data[:time],
    price: data[:price]
  )
end

puts "✅ Terminé! #{PotatoPrice.count} prix créés pour 3 jours différents"
puts "📅 Jour 1: 2025-11-15 (12 prix) - Journée avec bon gain"
puts "📅 Jour 2: 2025-11-16 (12 prix) - Journée volatile"
puts "📅 Jour 3: 2025-11-17 (12 prix) - Journée stable"