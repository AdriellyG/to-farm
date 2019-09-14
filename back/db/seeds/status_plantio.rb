puts "-> Creating seeds for StatusPlantio"

StatusPlantio.create!(descricao: "Agendado")
StatusPlantio.create!(descricao: "Andamento")
StatusPlantio.create!(descricao: "Finalizado")

puts "-> Created!"
puts "========================================"