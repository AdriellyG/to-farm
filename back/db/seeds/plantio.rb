puts "-> Creating seeds for Plantio"

plantio = [
    {
        dt_inicial: "2019-01-11",
        dt_final: "2020-01-01",
        areas_id: 1,
        fazendas_id: 1,
        cultivos_id: 1,
        status_plantio_id: 1
    },
    {
        dt_inicial: "2019-01-12",
        dt_final: "2020-01-02",
        areas_id: 2,
        fazendas_id: 2,
        cultivos_id: 2,
        status_plantio_id: 2
    },
    {
        dt_inicial: "2019-01-13",
        dt_final: "2020-01-03",
        areas_id: 3,
        fazendas_id: 3,
        cultivos_id: 3,
        status_plantio_id: 2
    }
]

plan_count = 0

plantio.each do |item|

    plan_count = plan_count + 1

    puts "=== > Creating plantio #{plan_count}"

    Plantio.create!(
        dt_inicial:        item[:dt_inicial],
        dt_final:          item[:dt_final],
        areas_id:          item[:areas_id],
        fazendas_id:       item[:fazendas_id],
        cultivos_id:       item[:cultivos_id],
        status_plantio_id: item[:status_plantio_id]
    )
end

puts "-> Created!"
puts "========================================"