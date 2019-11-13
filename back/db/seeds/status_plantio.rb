puts "-> Creating seeds for StatusPlantio"

status_plantio = [
    {
        descricao: "Agendado"
    },
    {
        descricao: "Andamento"
    },
    {
        descricao: "Finalizado"
    }
]

count = 0

status_plantio.each do | item |
    status_plantio = StatusPlantio.find_by(descricao: item[:descricao])

    if !status_plantio then
        count = count + 1

        puts "=== > Creating status_plantio #{count}"

        StatusPlantio.create!(descricao: item[:descricao])
    end
end
puts "-> Created!"
puts "========================================"