puts "-> Creating seeds for PessoaFisica..."

PessoaFisica.create!(cpf: "47656284321", pessoas_id: 1)
PessoaFisica.create!(cpf: "47656284123", pessoas_id: 2)
PessoaFisica.create!(cpf: "47656284543", pessoas_id: 3)

puts "-> Created!"
puts "========================================"