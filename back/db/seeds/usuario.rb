puts "-> Creating seeds for Usuario..."

Usuario.create!(email: "adriellygalvao@yahoo.com", password_digest: "mortadela124", pessoa_fisicas_id: 1)
Usuario.create!(email: "adrielly@yahoo.com",       password_digest: "mortadela443", pessoa_fisicas_id: 2)
Usuario.create!(email: "adriellyg@yahoo.com",      password_digest: "mortadela041", pessoa_fisicas_id: 3)

puts "-> Created!"
puts "========================================"