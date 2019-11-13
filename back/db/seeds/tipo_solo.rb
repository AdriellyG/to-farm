puts "-> Creating seeds for TipoSolo..."

tipo_solo = [
    {
        nome: "Argiloso", acidez: 0.48
    },
    {
        nome: "Humaso",   acidez: 0.34
    },
    {
        nome: "Arenoso",  acidez: 0.75
    }
]

count = 0

tipo_solo.each do | item |
    tipo_solo = TipoSolo.find_by(nome: item[:nome], acidez: item[:acidez])

    if !tipo_solo then
        count = count + 1

        puts "=== > Creating tipo_solo #{count}"

        TipoSolo.create!(nome: item[:nome], acidez: item[:acidez])
    end
end

puts "-> Created!"
puts "========================================"