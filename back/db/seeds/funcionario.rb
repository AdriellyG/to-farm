puts "-> Creating seeds for Funcionario..."

Funcionario.create!(cargo_id: 1, usuario_id: 1)
Funcionario.create!(cargo_id: 2, usuario_id: 2)
Funcionario.create!(cargo_id: 3, usuario_id: 3)

puts "-> Created!"
puts "========================================"