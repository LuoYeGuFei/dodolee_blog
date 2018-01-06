# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
module ActiveRecord
  class Base
    def self.seed!(array)
      puts "Seeding #{self} ..."
      delete_all
      self.create!(array)
    end

  end
end

Category.seed!([
  { id: 1, name: "转载" },
  { id: 2, name: "原创" },
  { id: 3, name: "翻译" }
])
