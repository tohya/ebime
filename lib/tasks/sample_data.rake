namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_relationships
    make_projects
    make_kintais
    make_assigns
    make_jissekis
  end
end

def make_users
  admin = User.create!(name: "小松菜月", email: "777",
                       password: "nkomatsu", password_confirmation: "nkomatsu", admin: true)
  User.create!(name: "矢沢彩夏", email: "100",
                       password: "ayazawa", password_confirmation: "ayazawa", admin: false)
  User.create!(name: "高木大和", email: "110",
                       password: "ytakagi", password_confirmation: "ytakagi", admin: false)
  User.create!(name: "大崎奈美", email: "111",
                       password: "nosaki", password_confirmation: "nosaki", admin: false)
  User.create!(name: "寺島紀彦", email: "112",
                       password: "nterashima", password_confirmation: "nterashima", admin: false)
  User.create!(name: "岡崎翔太", email: "113",
                       password: "sokazaki", password_confirmation: "sokazaki", admin: false)
  User.create!(name: "一之瀬隆弘", email: "120",
                       password: "tichinose", password_confirmation: "tichinose", admin: false)
  User.create!(name: "芹澤礼美", email: "121",
                       password: "lserizawa", password_confirmation: "lserizawa", admin: false)
  User.create!(name: "本城玲二", email: "122",
                       password: "rhonzyo", password_confirmation: "rhonzyo", admin: false)
  User.create!(name: "藤枝成宏", email: "123",
                       password: "nfujieda", password_confirmation: "nfujieda", admin: false)
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships  
  nkomatsu   = User.find_by_email("777")
  ayazawa    = User.find_by_email("100")
  ytakagi    = User.find_by_email("110")
  nosaki     = User.find_by_email("111")
  nterashima = User.find_by_email("112")
  sokazaki  = User.find_by_email("113")
  tichinose  = User.find_by_email("120")
  lserizawa  = User.find_by_email("121")
  rhonzyo    = User.find_by_email("122")
  nfujieda   = User.find_by_email("123")

  ayazawa.follow!(nkomatsu)
  ytakagi.follow!(nkomatsu)
  nosaki.follow!(nkomatsu)
  nterashima.follow!(nkomatsu)
  sokazaki.follow!(nkomatsu)
  tichinose.follow!(nkomatsu)
  lserizawa.follow!(nkomatsu)
  rhonzyo.follow!(nkomatsu)
  nfujieda.follow!(nkomatsu)

  nosaki.follow!(ytakagi)
  nterashima.follow!(ytakagi)
  sokazaki.follow!(ytakagi)

  lserizawa.follow!(tichinose)
  rhonzyo.follow!(tichinose)
  nfujieda.follow!(tichinose)
end

def make_projects
  Project.create!(name: "Food")
  Project.create!(name: "Sports")
  Project.create!(name: "Music")
  Project.create!(name: "History")
  Project.create!(name: "Health")
end

def make_kintais
  nosaki = User.find_by_email("111")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-01", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-02", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-03", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-04", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-05", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-06", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-07", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-08", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-09", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-10", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-11", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-12", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-13", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-14", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-15", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-16", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-17", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-18", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-19", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-20", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-21", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-22", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-23", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-24", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-25", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-26", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-27", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-28", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-29", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: nosaki.id, date: "2015-09-30", start:"09:00:00", end:"17:30:00")
end

def make_assigns
  nosaki = User.find_by_email("111")
  UserProject.create!(user_id: nosaki.id, project_id: 1)
  UserProject.create!(user_id: nosaki.id, project_id: 2)
  UserProject.create!(user_id: nosaki.id, project_id: 3)
end

def make_jissekis
  nosaki = User.find_by_email("111")
  u_p = UserProject.where("user_id = ?", nosaki.id)
  u_p_1 = u_p.first.id
  u_p_2 = u_p.second.id
  u_p_3 = u_p.third.id
  Jisseki.create!(user_project_id: u_p_1, date: "2015-09-01 00:00:00", time:"02:30:00")
  Jisseki.create!(user_project_id: u_p_1, date: "2015-09-02 00:00:00", time:"02:30:00")
  Jisseki.create!(user_project_id: u_p_1, date: "2015-09-03 00:00:00", time:"02:30:00")
  Jisseki.create!(user_project_id: u_p_1, date: "2015-09-04 00:00:00", time:"02:30:00")
  Jisseki.create!(user_project_id: u_p_1, date: "2015-09-05 00:00:00", time:"02:30:00")
  Jisseki.create!(user_project_id: u_p_2, date: "2015-09-01 00:00:00", time:"03:00:00")
  Jisseki.create!(user_project_id: u_p_2, date: "2015-09-02 00:00:00", time:"03:00:00")
  Jisseki.create!(user_project_id: u_p_2, date: "2015-09-03 00:00:00", time:"03:00:00")
  Jisseki.create!(user_project_id: u_p_2, date: "2015-09-04 00:00:00", time:"03:00:00")
  Jisseki.create!(user_project_id: u_p_2, date: "2015-09-05 00:00:00", time:"03:00:00")
  Jisseki.create!(user_project_id: u_p_3, date: "2015-09-01 00:00:00", time:"02:00:00")
  Jisseki.create!(user_project_id: u_p_3, date: "2015-09-02 00:00:00", time:"02:00:00")
  Jisseki.create!(user_project_id: u_p_3, date: "2015-09-03 00:00:00", time:"02:00:00")
  Jisseki.create!(user_project_id: u_p_3, date: "2015-09-04 00:00:00", time:"02:00:00")
  Jisseki.create!(user_project_id: u_p_3, date: "2015-09-05 00:00:00", time:"02:00:00")
end

