# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create username:'admin', password:'password', password_confirmation:'password', email:'admin@admin.com'

collections_per_subject = 10
images_per_collection = 20
image_size_max = 10000

Subject.create date: "2014-11-13 13:16:00", brand: "Samsung", model: "SGS5", device: "Galaxy S5", product: "Galaxy", serial: "331929480", uid: "##d#*@Y)0d8042999",
               gender: "male", age: "20", country: "Kazakhstan", version: '4.4'
Subject.create date: "2014-11-13 13:16:00", brand: "Samsung", model: "SGS5", device: "Galaxy S5", product: "Galaxy", serial: "28357023", uid: "S#NTHYcuhcsst",
               gender: "male", age: "1", country: "Finland", version: '5.0'
Subject.create date: "2014-11-13 13:16:00", brand: "Google", model: "NX7", device: "Nexus 7", product: "Nexus", serial: "9357980", uid: "SH$Y((9i9D{i0e00",
               gender: "female", age: "79", country: "Sweden", version: '4.2'

Subject.all.each do |s|
  cols = rand(collections_per_subject)
  (1...cols).each do |i|
    time = Time.now
    ic = Collection.create subject_id: s.id, date: time
    image_count = rand(images_per_collection)
    (1...image_count).each do |img|
      ic.images.create date: time, size: rand(image_size_max), date_modified: time, date_added: time, date_taken: time, is_private: true, latitude:0, longitude:0
    end
  end

end