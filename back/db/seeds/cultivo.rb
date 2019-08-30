puts "-> Creating seeds for Cultivo..."

Cultivo.create!(nome: "Morango", tipo_cultivo_id: 1, fazenda_id: 1)
Cultivo.create!(nome: "Alface",  tipo_cultivo_id: 2, fazenda_id: 1)
Cultivo.create!(nome: "Jilo",    tipo_cultivo_id: 3, fazenda_id: 1)

puts "-> Created!"
puts "========================================"