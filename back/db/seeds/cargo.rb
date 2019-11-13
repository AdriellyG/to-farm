puts "-> Creating seeds for Cargo..."

cargos = [
    {
        nome: "Gerente de finanças",
        descricao: "Gerencia as finanças"
    },
    {
        nome: "Gerente geral",
        descricao: "Gerencia a fazenda como um todo"
    },
    {
        nome: "Auxiliar da gerencia",
        descricao: "Auxilia a gerência"
    }
]

count = 0

cargos.each do | item |
    cargos = Cargo.find_by(nome: item[:nome], descricao: item[:descricao])

    if !cargos then
        count = count + 1

        puts "=== > Creating cargos #{count}"

        Cargo.create!(nome: item[:nome], descricao: item[:descricao])
    end
end

puts "-> Created!"
puts "========================================"