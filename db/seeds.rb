# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin::Article.all.each do |a|
  year,month = a.created_at.year,a.created_at.month
  a.archive_id = Admin::Archive.find_or_create_by(year:year,month:month,author_id:a.author.id).id
  a.save
end
