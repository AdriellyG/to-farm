# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "****************************************"
puts 'Starting seeds...'

puts "========================================"
load File.join(Rails.root, 'db', 'seeds', 'pessoa.rb')
load File.join(Rails.root, 'db', 'seeds', 'pessoa_fisica.rb')
load File.join(Rails.root, 'db', 'seeds', 'pessoa_juridica.rb')
load File.join(Rails.root, 'db', 'seeds', 'fazenda.rb')
load File.join(Rails.root, 'db', 'seeds', 'fazenda_has_plano.rb')
load File.join(Rails.root, 'db', 'seeds', 'plano.rb')
load File.join(Rails.root, 'db', 'seeds', 'usuario.rb')
load File.join(Rails.root, 'db', 'seeds', 'tipo_cultivo.rb')
load File.join(Rails.root, 'db', 'seeds', 'cultivo.rb')

puts 'Finished!'
puts "****************************************"