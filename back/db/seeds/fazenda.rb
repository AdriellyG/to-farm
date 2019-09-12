puts "-> Creating seeds for Fazenda..."

fazenda = [
    {
        nome: "Fazenda 1",
        rua: "Rua 1",
        numero: "1",
        cep: 12570000,
        estado: "ES",
        cidade: "Cidade 1",
        pessoa_id: 1
    },
    {
        nome: "Fazenda 2",
        rua: "Rua 2",
        numero: "2",
        cep: 12570001,
        estado: "RJ",
        cidade: "Cidade 2",
        pessoa_id: 2
    },
    {
        nome: "Fazenda 3",
        rua: "Rua 3",
        numero: "3",
        cep: 12570003,
        estado: "SP",
        cidade: "Cidade 3",
        pessoa_id: 3
    },
    {
        nome: "Fazenda 4",
        rua: "Rua 4",
        numero: "4",
        cep: 12570004,
        estado: "SP",
        cidade: "Cidade 4",
        pessoa_id: 4
    }
]

faz_count = 0

fazenda.each do |item|
    fazenda_item = Fazenda.find_by(nome: item[:nome], pessoa_id: item[:pessoa_id])

    if !fazenda_item then
        faz_count = faz_count + 1

        puts "-- > Creating fazenda #{faz_count}"

        Fazenda.create!(
            nome:      item[:nome],
            rua:       item[:rua],
            numero:    item[:numero],
            cep:       item[:cep],
            estado:    item[:estado],
            cidade:    item[:cidade],
            pessoa_id: item[:pessoa_id]
        )
    end
end

puts "-> Created!"
puts "========================================"