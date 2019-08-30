puts "-> Creating seeds for Fazenda..."

Fazenda.create!(
    nome: "Fazenda 1",
    rua: "Rua 1",
    numero: "1",
    cep: 12570000,
    estado: "ES",
    cidade: "Cidade 1",
    pessoa_id: 1
)

Fazenda.create!(
    nome: "Fazenda 2",
    rua: "Rua 2",
    numero: "2",
    cep: 12570001,
    estado: "RJ",
    cidade: "Cidade 2",
    pessoa_id: 2
)

Fazenda.create!(
    nome: "Fazenda 3",
    rua: "Rua 3",
    numero: "3",
    cep: 12570003,
    estado: "SP",
    cidade: "Cidade 3",
    pessoa_id: 3
)

puts "-> Created!"
puts "========================================"