puts "-> Creating seeds for Usuario..."

Usuario.create!(email: "adriellygalvao@yahoo.com", senha: "mortadela124", pessoa_fisicas_id: 1)
Usuario.create!(email: "adrielly@yahoo.com",       senha: "mortadela443", pessoa_fisicas_id: 2)
Usuario.create!(email: "adriellyg@yahoo.com",      senha: "mortadela041", pessoa_fisicas_id: 3)

puts "-> Created!"
puts "========================================"