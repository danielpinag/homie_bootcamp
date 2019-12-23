namespace :homes_tasks do
  desc "This task creates two home records"
  task create_homes: :environment do
    user = User.find_or_create_by!(
      email: "danielalexpg@gmail.com",
      name: "Daniel",
      last_name: "Piña",
      mobile_phone: "9994348764",
      work_place: "Homie"
    )

    owner = Owner.find_or_create_by!(
      user: user,
      curp: "PIGD020711HYNXTNA5",
      registered_in_srpago: true
    )

    first_home = Home.find_or_create_by!(
      owner: owner,
      price: 5000.00,
      extra_service: 1200.00,
      home_features: {garden: true, furnished: false, gym: false},
      _status: :in_progress
    )

    second_home = Home.find_or_create_by!(
      owner: owner,
      price: 12000.00,
      extra_service: 5000.00,
      home_features: {garden: true, furnished: true, gym: false},
      _status: :published
    )

    puts "Created #{first_home.inspect}", "Created #{second_home.inspect}"
  end
end