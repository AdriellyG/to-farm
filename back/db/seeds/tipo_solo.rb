puts "-> Creating seeds for TipoSolo..."

TipoSolo.create!(nome: "Argiloso", acidez: 0.48)
TipoSolo.create!(nome: "Humaso",   acidez: 0.34)
TipoSolo.create!(nome: "Arenoso",  acidez: 0.75)

puts "-> Created!"
puts "========================================"