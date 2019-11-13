puts "-> Creating seeds for Area"

areas = [
    {
        nome: "Area 1",
        fazenda_id: 1,
        tipo_solo_id: 1,
        local_fisico_id: 1
    },
    {
        nome: "Area 2",
        fazenda_id: 2,
        tipo_solo_id: 2,
        local_fisico_id: 2
    },
    {
        nome: "Area 3",
        fazenda_id: 3,
        tipo_solo_id: 3,
        local_fisico_id: 3
    }
]

count = 0

areas.each do |item|
    areas = Area.find_by(
        nome: item[:nome],
        fazenda_id: item[:fazenda_id],
        tipo_solo_id: item[:tipo_solo_id],
        local_fisico_id: item[:local_fisico_id]
    )

    if !areas then
        count = count + 1

        puts "=== > Creating areas #{count}"

        Area.create!(
            nome: item[:nome],
            fazenda_id: item[:fazenda_id],
            tipo_solo_id: item[:tipo_solo_id],
            local_fisico_id: item[:local_fisico_id]
        )
    end
end

puts "-> Created!"
puts "========================================"