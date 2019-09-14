puts "-> Creating seeds for FazendaHasPlano..."

FazendaHasPlano.create!(dt_inicio: Time.current, fazendas_id: 1, planos_id: 1, ativo: true)
FazendaHasPlano.create!(dt_inicio: Time.current, fazendas_id: 2, planos_id: 2, ativo: true)
FazendaHasPlano.create!(dt_inicio: Time.current, fazendas_id: 3, planos_id: 1, ativo: true)

puts "-> Created!"
puts "========================================"