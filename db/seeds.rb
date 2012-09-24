# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all
Category.destroy_all

categories = %w{abstract animals city food nightlife fashion people nature sports technics transport}.map do |name|
  Category.create name: name
end

100.times do |i|
  Post.create do |p|
    p.title = Faker::Company.catch_phrase
    p.body = Faker::Lorem.paragraphs.join(' ')
    p.category = categories.sample
    p.picture_number = rand(10)+1

    rand(10).next.times do |j|
      p.comments.build :body => Faker::Lorem.paragraphs.join(' ')
    end

    rand(10).next.times do |j|
      p.trackbacks.build :url => Faker::Internet.domain_name
    end
  end
end
