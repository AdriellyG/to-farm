puts "-> Creating seeds for Usuario..."

usuarios = [
    {
        email: "adriellygalvao@yahoo.com",
        password_digest: "mortadela124",
        pessoa_fisicas_id: 1
    },
    {
        email: "adrielly@yahoo.com",
        password_digest: "mortadela443",
        pessoa_fisicas_id: 2
    },
    {
        email: "adriellyg@yahoo.com",
        password_digest: "mortadela041",
        pessoa_fisicas_id: 3
    }

]

count = 0

usuarios.each do | item |
    Usuario.find_by(
        email: item[:email],
        password_digest: item[:password_digest],
        pessoa_fisicas_id: item[:pessoa_fisicas_id]
    )

    if !usuarios then
        count = count + 1
        puts "=== > Creating usuario #{count}"
        Usuario.create!(
            email: item[:email],
            password_digest: item[:password_digest],
            pessoa_fisicas_id: item[:pessoa_fisicas_id]
        )
    end
end

puts "-> Created!"
puts "========================================"