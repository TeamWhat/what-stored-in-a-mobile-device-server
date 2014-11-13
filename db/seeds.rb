# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create username:'admin', password:'password', password_confirmation:'password', email:'admin@admin.com'

image_collections_per_subject = 10
images_per_collection = 20
image_size_max = 10000

Subject.create date: "2014-11-13 13:16:00", brand: "Samsung", model: "SGS5", device: "Galaxy S5", product: "Galaxy", serial: "331929480", uid: "##d#*@Y)0d8042999"
Subject.create date: "2014-11-13 13:16:00", brand: "Samsung", model: "SGS5", device: "Galaxy S5", product: "Galaxy", serial: "28357023", uid: "S#NTHYcuhcsst"
Subject.create date: "2014-11-13 13:16:00", brand: "Google", model: "NX7", device: "Nexus 7", product: "Nexus", serial: "9357980", uid: "SH$Y((9i9D{i0e00"

Subject.all.each do |s|
  img_cols = rand(image_collections_per_subject)
  (1...img_cols).each do |i|
    time = Time.now
    ic = ImageCollection.create subject_id: s.id, date: time
    image_count = rand(images_per_collection)
    (1...image_count).each do |img|
      ic.images.create date: time, size: rand(image_size_max), date_modified: time, date_added: time, date_taken: time, is_private: true, latitude:0, longitude:0
    end
  end

end