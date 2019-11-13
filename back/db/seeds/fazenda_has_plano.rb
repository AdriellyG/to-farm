puts "-> Creating seeds for FazendaHasPlano..."

fazenda_has_plano = [
    {
        dt_inicio: Time.current,
        fazendas_id: 1,
        planos_id: 1,
        ativo: true
    },
    {
        dt_inicio: Time.current,
        fazendas_id: 2,
        planos_id: 2,
        ativo: true
    },
    {
        dt_inicio: Time.current,
        fazendas_id: 3,
        planos_id: 1,
        ativo: true
    }
]

count = 0

fazenda_has_plano.each do | item |
    fazenda_has_plano = FazendaHasPlano.find_by(
        dt_inicio: item[:dt_inicio],
        fazendas_id: item[:fazendas_id],
        planos_id: item[:planos_id],
        ativo: item[:ativo]
    )

    if !fazenda_has_plano then
        count = count + 1
        puts "=== > Creating fazenda_has_plano #{count}"
        
        FazendaHasPlano.create!(
            dt_inicio: item[:dt_inicio],
            fazendas_id: item[:fazendas_id],
            planos_id: item[:planos_id],
            ativo: item[:ativo]
        )
    end
end

puts "-> Created!"
puts "========================================"