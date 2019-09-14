puts "-> Creating seeds for Cultivo..."

cultivo = [
    {
        nome: "Morango",
        tipo_cultivos_id: 1,
        fazendas_id: 1
    },
    {
        nome: "Alface",
        tipo_cultivos_id: 2,
        fazendas_id: 1
    },
    {
        nome: "Jilo",
        tipo_cultivos_id: 3,
        fazendas_id: 1
    }
]

cul_count = 0

cultivo.each do |item|
    cultivo_item = Cultivo.find_by(nome: item[:nome], tipo_cultivos_id: item[:tipo_cultivos_id])

    if !cultivo_item then
        cul_count = cul_count + 1

        puts "=== > Creating cultivo #{cul_count}"

        Cultivo.create!(
            nome:             item[:nome],
            tipo_cultivos_id: item[:tipo_cultivos_id],
            fazendas_id:      item[:fazendas_id]
        )
    end
end

puts "-> Created!"
puts "========================================"