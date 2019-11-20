puts "-> Creating seeds for Usuario..."

usuarios = [
    {
        email: "adrielly@email.com",
        password_digest: "$2y$12$XTCJtlsNyS3IfgK069a6kewoEjxRRW7Xo3VlVWuUFjp6xbwetZ672",
        pessoa_fisicas_id: 1
    },
    {
        email: "fernanda@email.com",
        password_digest: "$2y$12$AR4xMDvIFBrUW0IPq1IXi.ljVbPxq/6g9bYwEOxlSiLQLz.wQKDoi",
        pessoa_fisicas_id: 2
    }

]

count = 0

usuarios.each do | item |
    usuarios = Usuario.find_by(
        email: item[:email],
        pessoa_fisicas_id: item[:pessoa_fisicas_id]
    )

    if !usuarios then
        count = count + 1
        puts "=== > Creating usuario #{count}"
        Usuario.create!(
            email: item[:email],
            password_digest: item[:password_digest],
            #password_confirmation: item[:password_confirmation],
            pessoa_fisicas_id: item[:pessoa_fisicas_id]
        )
    end
end

puts "-> Created!"
puts "========================================"