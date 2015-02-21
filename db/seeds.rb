# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: 'sccsa-admin', password: 'sccsapassword', email: 'admin@sccsa.org.cn',unit: '上海社区体育协会', is_admin: true, role_id: '3')
Role.create!(name: '无权限')
Role.create!(name: '社区／俱乐部')
Role.create!(name: '配送单位')
