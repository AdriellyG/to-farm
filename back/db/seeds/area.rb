puts "-> Creating seeds for Area"

Area.create!(nome: "Area 1", fazenda_id: 1, tipo_solo_id: 1, local_fisico_id: 1)
Area.create!(nome: "Area 2", fazenda_id: 2, tipo_solo_id: 2, local_fisico_id: 2)
Area.create!(nome: "Area 3", fazenda_id: 3, tipo_solo_id: 3, local_fisico_id: 3)

puts "-> Created!"
puts "========================================"