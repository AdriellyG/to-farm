puts "-> Creating seeds for Funcionario..."

funcionario = [
    {
        cargo_id: 1,
        usuario_id: 1
    },
    {
        cargo_id: 2,
        usuario_id: 2
    },
    {
        cargo_id: 3,
        usuario_id: 3
    }
]

count = 0;

funcionario.each do | item |
    funcionario = Funcionario.find_by(cargo_id: item[:cargo_id], usuario_id: item[:usuario_id])

    if !funcionario then
        count = count + 1
        puts "=== > Creating funcionario #{count}"
        Funcionario.create!(cargo_id: item[:cargo_id], usuario_id: item[:usuario_id])
    end
end


puts "-> Created!"
puts "========================================"