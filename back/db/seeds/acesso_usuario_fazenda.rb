puts "-> Creating seeds for AcessoUsuarioFazenda..."

acesso_usuario_fazenda = [
    {
        usuario_id: 1,
        fazenda_id: 1
    },
    {
        usuario_id: 1,
        fazenda_id: 2
    },
    {
        usuario_id: 1,
        fazenda_id: 3
    },
    {
        usuario_id: 2,
        fazenda_id: 2
    },
    {
        usuario_id: 3,
        fazenda_id: 3
    }
]

ace_count = 0

acesso_usuario_fazenda.each do |item|
    acesso_usuario_fazenda = AcessoUsuarioFazenda.find_by(usuario_id: item[:usuario_id], fazenda_id: item[:fazenda_id])

    if !acesso_usuario_fazenda then
        ace_count = ace_count + 1

        puts "=== > Creating acesso_usuario_fazenda #{ace_count}"

        AcessoUsuarioFazenda.create!(
            usuario_id: item[:usuario_id],
            fazenda_id: item[:fazenda_id]
        )
    end
end

puts "-> Created!"
puts "========================================"