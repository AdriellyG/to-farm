puts "-> Creating seeds for Plano..."

plano = [
    {
        nome: "Básico",
        valor: 70
    },
    {
        nome: "Premium",
        valor: 120
    }
]

count = 0

plano.each do | item |
    plano = Plano.find_by(nome: item[:nome], valor: item[:valor])

    if !plano then
        count = count + 1

        puts "=== > Creating plano #{count}"

        Plano.create!(nome: item[:nome], valor: item[:valor])
    end
end

puts "-> Created!"
puts "========================================"