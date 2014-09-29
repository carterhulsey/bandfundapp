# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Genre.create!(name: "Rock")
Genre.create!(name: "Country")
Artist.create(name: "jay", password: "password", password_confirmation: "password", about_me: "awesome", website_url: "test.com", paypal_link: "paypal.com", genre_id: 1, email: "test@gmail.com", city: "city", state: "pa")