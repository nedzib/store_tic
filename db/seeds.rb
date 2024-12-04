# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

# Create main admin
print "Seeeding database... "

User.create!(email: "admin@gmail.com", password: "password", password_confirmation: "password", is_superadmin: true)

Kind.create!(
  name: "Impresora",
  margin: 15.0,
  revision_price_cents: 5000.0
)

Kind.create!(
  name: "Computador",
  margin: 10.0,
  revision_price_cents: 10000.0
)

Kind.create!(
  name: "Tablet",
  margin: 12.5,
  revision_price_cents: 7500.0
)

Inspect.create!(
  body: "Revisión completa de la impresora",
  email: "cliente1@example.com",
  phone: "123456789",
  revision_date: DateTime.now - 2.days,
  revision_time: "10:00 AM",
  status: :requested,
  status_updated_at: DateTime.now - 1.day,
  kind_id: Kind.find_by(name: "Impresora").id
)

Inspect.create!(
  body: "Revisión de hardware y software del computador",
  email: "cliente2@example.com",
  phone: "987654321",
  revision_date: DateTime.now - 1.week,
  revision_time: "2:30 PM",
  status: :in_progress,
  status_updated_at: DateTime.now - 3.days,
  kind_id: Kind.find_by(name: "Computador").id
)

Inspect.create!(
  body: "Inspección de pantalla y batería de la tablet",
  email: "cliente3@example.com",
  phone: "456789123",
  revision_date: DateTime.now - 5.days,
  revision_time: "11:00 AM",
  status: :waiting_for_client,
  status_updated_at: DateTime.now - 2.days,
  kind_id: Kind.find_by(name: "Tablet").id
)


puts "done!"
