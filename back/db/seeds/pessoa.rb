puts "-> Creating seeds for pessoa..."

pessoa = [
    {
        nome: "Maxwell"
    },
    {
        nome: "Adrielly"
    },
    {
        nome: "Fernanda"
    },
    {
        nome: "Pirico"
    },
    {
        nome: "Emilia"
    },
    {
        nome: "Xayah"
    }
]

count = 0

pessoa.each do | item |
    pessoa = Pessoa.find_by(nome: item[:nome])

    if !pessoa then
        count = count + 1

        puts "=== > Creating pessoa #{count}"

        Pessoa.create!(nome: item[:nome])
    end
end

puts "-> Created!"
puts "========================================"