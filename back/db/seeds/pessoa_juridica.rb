puts "-> Creating seeds for PessoaJuridica..."

pessoa_juridica = [
    {
        cnpj: "62872638371",
        pessoas_id: 4
    },
    {
        cnpj: "83875919047",
        pessoas_id: 5
    },
    {
        cnpj: "47656286563",
        pessoas_id: 6
    }
]

count = 0

pessoa_juridica.each do | item |
    pessoa_juridica = PessoaJuridica.find_by(cnpj: item[:cnpj], pessoas_id: item[:pessoas_id])

    if !pessoa_juridica then
        count = count + 1

        puts "=== > Creating pessoa_juridica #{count}"

        PessoaJuridica.create!(cnpj: item[:cnpj], pessoas_id: item[:pessoas_id])
    end
end

puts "-> Created!"
puts "========================================"