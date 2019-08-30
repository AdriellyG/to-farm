puts "-> Creating seeds for PessoaJuridica..."

PessoaJuridica.create!(cnpj: "62872638371", pessoa_id: 4)
PessoaJuridica.create!(cnpj: "83875919047", pessoa_id: 5)
PessoaJuridica.create!(cnpj: "47656286563", pessoa_id: 6)

puts "-> Created!"
puts "========================================"