puts "-> Creating seeds for PessoaFisica..."

PessoaFisica.create!(cpf: "47656284321", pessoa_id: 1)
PessoaFisica.create!(cpf: "47656284123", pessoa_id: 2)
PessoaFisica.create!(cpf: "47656284543", pessoa_id: 3)

puts "-> Created!"
puts "========================================"