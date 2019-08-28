puts "-> Creating seeds for TipoCultivo..."

TipoCultivo.create!({
    nome: 'Fruta'
})

TipoCultivo.create!({
    nome: 'Verdura'
})

TipoCultivo.create!({
    nome: 'Legume'
})

puts "-> Created!"