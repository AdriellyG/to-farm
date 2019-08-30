puts "-> Creating seeds for plano..."

Plano.create!({
    nome: 'Básico',
    valor: 70
})

Plano.create!({
    nome: 'Premium',
    valor: 120
})

puts "-> Created!"
puts "========================================"