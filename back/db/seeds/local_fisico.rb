puts "-> Creating seeds for LocalFisico..."

LocalFisico.create!(nome: "Local 1", descricao: "Assunto 1", fazenda_id: 1)
LocalFisico.create!(nome: "Local 2", descricao: "Assunto 2", fazenda_id: 2)
LocalFisico.create!(nome: "Local 3", descricao: "Assunto 3", fazenda_id: 3)

puts "-> Created!"
puts "========================================"