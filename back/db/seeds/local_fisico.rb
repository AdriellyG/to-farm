puts "-> Creating seeds for LocalFisico..."

local_fisico = [
    {
        nome: "Local 1",
        descricao: "Assunto 1",
        fazenda_id: 1
    },
    {
        nome: "Local 2",
        descricao: "Assunto 2",
        fazenda_id: 2
    },
    {
        nome: "Local 3",
        descricao: "Assunto 3",
        fazenda_id: 3
    }
]

count = 0

local_fisico.each do | item |
    local_fisico = LocalFisico.find_by(
        nome: item[:nome],
        descricao: item[:descricao],
        fazenda_id: item[:fazenda_id]
    )

    if !local_fisico then
        count = count + 1
        
        puts "=== > Creating local_fisico #{count}"
        
        LocalFisico.create!(
            nome: item[:nome],
            descricao: item[:descricao],
            fazenda_id: item[:fazenda_id]
        )
    end
end

puts "-> Created!"
puts "========================================"