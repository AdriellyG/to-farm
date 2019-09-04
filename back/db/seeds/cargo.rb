puts "-> Creating seeds for Cargo..."

Cargo.create!(nome: "Gerente de finanças", descricao: "Gerencia as finanças")
Cargo.create!(nome: "Gerente geral", descricao: "Gerencia a fazenda como um todo")
Cargo.create!(nome: "Auxiliar da gerencia", descricao: "Auxilia a gerência")

puts "-> Created!"
puts "========================================"