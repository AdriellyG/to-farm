puts "-> Creating seeds for FazendaHasPlano..."

FazendaHasPlano.create!(dt_inicio: Time.current, fazenda_id: 1, plano_id: 1, ativo: true)
FazendaHasPlano.create!(dt_inicio: Time.current, fazenda_id: 2, plano_id: 2, ativo: true)
FazendaHasPlano.create!(dt_inicio: Time.current, fazenda_id: 3, plano_id: 1, ativo: true)

puts "-> Created!"
puts "========================================"