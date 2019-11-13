puts "-> Creating seeds for PessoaFisica..."

pessoa_fisica = [
    {
        cpf: "47656284321",
        pessoas_id: 1
    },
    {
        cpf: "47656284123",
        pessoas_id: 2
    },
    {
        cpf: "47656284543",
        pessoas_id: 3
    }
]

count = 0

pessoa_fisica.each do | item |
    pessoa_fisica = PessoaFisica.find_by(cpf: item[:cpf], pessoas_id: item[:pessoas_id])

    if !pessoa_fisica then
        count = count + 1

        puts "=== > Creating pessoa_fisica #{count}"

        PessoaFisica.create!(cpf: item[:cpf], pessoas_id: item[:pessoas_id])
    end
end

puts "-> Created!"
puts "========================================"