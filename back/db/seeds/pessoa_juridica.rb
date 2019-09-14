puts "-> Creating seeds for PessoaJuridica..."

PessoaJuridica.create!(cnpj: "62872638371", pessoas_id: 4)
PessoaJuridica.create!(cnpj: "83875919047", pessoas_id: 5)
PessoaJuridica.create!(cnpj: "47656286563", pessoas_id: 6)

puts "-> Created!"
puts "========================================"