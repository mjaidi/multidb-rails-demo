# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Tenant.create(name: "Tenant 1", subdomain: "", shard: "tenant_1")
Tenant.create(name: "Tenant 2", subdomain: "br", shard: "tenant_2")
