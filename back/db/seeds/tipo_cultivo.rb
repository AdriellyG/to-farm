puts "-> Creating seeds for TipoCultivo..."

tipo_cultivo = [
    {
        nome: "Fruta",
        ativo: true
    },
    {
        nome: "Verdura",
        ativo: true
    },
    {
        nome: "Legume",
        ativo: true
    }
]

count = 0

tipo_cultivo.each do | item |
    tipo_cultivo = TipoCultivo.find_by(nome: item[:nome], ativo: item[:ativo])

    if !tipo_cultivo then
        count = count + 1

        puts "=== > Creating tipo_cultivo #{count}"

        TipoCultivo.create!(nome: item[:nome], ativo: item[:ativo])
    end
end

puts "-> Created!"
puts "========================================"