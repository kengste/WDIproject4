# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
Client.create(id: 1, name: 'Platoon Pte Ltd', phone_number: '81831000', email: 'abc@gmail.com', user_id: 2)
Client.create(id: 2, name: 'Alpha Macro Pte Ltd', phone_number: '11831000', email: 'abcd@gmail.com', user_id: 2)
Client.create(id: 3, name: 'First Fund Pte Ltd', phone_number: '21831000', email: 'abce@gmail.com', user_id: 3)
Client.create(id: 4, name: 'Hubtel Pte Ltd', phone_number: '31831000', email: 'abcf@gmail.com', user_id: 3)
Client.create(id: 5, name: 'The First World Pte Ltd', phone_number: '51831000', email: 'abcg@gmail.com', user_id: 2)
Client.create(id: 6, name: 'Greedisgood Pte Ltd', phone_number: '41831000', email: 'abch@gmail.com', user_id: 3)
Client.create(id: 7, name: 'Golden Triangle Pte Ltd', phone_number: '71831000', email: 'abci@gmail.com', user_id: 2)
Client.create(id: 8, name: 'Kranken Pte Ltd', phone_number: '91831000', email: 'abcj@gmail.com', user_id: 3)
[:admin, :manager].each do |role|
  Role.where({ name: role }, without_protection: true).first_or_create
end
Staff.create(id: 1, email: 'benny@tracked.com', password: 'password', first_name: 'Benny', last_name: 'Ang')
Staff.create(id: 2, email: 'john@tracked.com', password: 'password', first_name: 'John', last_name: 'Ong')
Staff.create(id: 3, email: 'jane@tracked.com', password: 'password', first_name: 'Jane', last_name: 'Tan')
Staff.create(id: 4, email: 'peter@tracked.com', password: 'password', first_name: 'Peter', last_name: 'Liu')
Staff.create(id: 5, email: 'june@tracked.com', password: 'password', first_name: 'June', last_name: 'Lee')
Staff.create(id: 6, email: 'andrew@tracked.com', password: 'password', first_name: 'Andrew', last_name: 'Ang')
Staff.create(id: 7, email: 'carmela@tracked.com', password: 'password', first_name: 'Carmela', last_name: 'Ong')
Staff.create(id: 8, email: 'dickson@tracked.com', password: 'password', first_name: 'Dickson', last_name: 'Koh')
Staff.create(id: 9, email: 'gail@tracked.com', password: 'password', first_name: 'Gail', last_name: 'Tan')
Staff.create(id: 10, email: 'eugene@tracked.com', password: 'password', first_name: 'Eugene', last_name: 'Xu')
Staff.create(id: 11, email: 'larry@tracked.com', password: 'password', first_name: 'Larry', last_name: 'Hing')
User.create(id: 1, email: 'bob@tracked.com', password: 'password', first_name: 'Bob', last_name: 'Ian', admin: true)
User.create(id: 2, email: 'carmen@tracked.com', password: 'password', first_name: 'Carmen', last_name: 'Ong', admin: false)
User.create(id: 3, email: 'david@tracked.com', password: 'password', first_name: 'David', last_name: 'Ong', admin: false)
User.create(id: 4, email: 'janice@tracked.com', password: 'password', first_name: 'Janice', last_name: 'Low', admin: false)
