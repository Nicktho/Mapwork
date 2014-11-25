# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Controller.destroy_all
Software.destroy_all
Mapping.destroy_all
Comment.destroy_all
User.destroy_all

nick = User.create(name: 'nick', email: 'nick@nick.com', password: 'nick', password_confirmation: 'nick')
nick.admin = true
nick.save

Controller.create(name: 'Test Controller 1')
Controller.create(name: 'Test Controller 2')

Software.create(name: 'Test Software 1')
Software.create(name: 'Test Software 2')

Mapping.create(name: 'Test Mapping 1', description: "Testing one two three", controller_id: 1, software_id: 1, user_id: 1, url: 'http://test.com')
Mapping.create(name: 'Test Mapping 2', description: "Testing one two three", controller_id: 1, software_id: 1, user_id: 1, url: 'http://test.com')
Mapping.create(name: 'Test Mapping 3', description: "Testing one two three", controller_id: 1, software_id: 2, user_id: 1, url: 'http://test.com')
Mapping.create(name: 'Test Mapping 4', description: "Testing one two three", controller_id: 2, software_id: 2, user_id: 1, url: 'http://test.com')

Comment.create(body: 'Test Comment 1', user_id: 1, mapping_id: 1)
Comment.create(body: 'Test Comment 2', user_id: 1, mapping_id: 1)
Comment.create(body: 'Test Comment 3', user_id: 1, mapping_id: 2)

