puts "-> Creating seeds for PessoaJuridica..."

PessoaJuridica.create!({
    cnpj: "47656284850",
    pessoa_id: 1
})

puts "-> Created!"
puts "========================================"