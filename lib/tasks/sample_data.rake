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
  @nkomatsu = User.create!(name: "小松菜月", email: "777",
                       password: "nkomatsu", password_confirmation: "nkomatsu", 
                       role: 3, admin: true)
  @ayazawa = User.create!(name: "矢沢彩夏", email: "100",
                       password: "ayazawa", password_confirmation: "ayazawa", 
                       role: 3,admin: false)
  @ytakagi = User.create!(name: "高木大和", email: "110",
                       password: "ytakagi", password_confirmation: "ytakagi", 
                       role: 2,admin: false)
  @nosaki = User.create!(name: "大崎奈美", email: "111",
                       password: "nosaki", password_confirmation: "nosaki", 
                       role: 1,admin: false)
  @nterashima = User.create!(name: "寺島紀彦", email: "112",
                       password: "nterashima", password_confirmation: "nterashima", 
                       role: 1,admin: false)
  @sokazaki = User.create!(name: "岡崎翔太", email: "113",
                       password: "sokazaki", password_confirmation: "sokazaki", 
                       role: 1,admin: false)
  @tichinose = User.create!(name: "一之瀬隆弘", email: "120",
                       password: "tichinose", password_confirmation: "tichinose", 
                       role: 2,admin: false)
  @lserizawa = User.create!(name: "芹澤礼美", email: "121",
                       password: "lserizawa", password_confirmation: "lserizawa", 
                       role: 1,admin: false)
  @rhonzyo = User.create!(name: "本城玲二", email: "122",
                       password: "rhonzyo", password_confirmation: "rhonzyo", 
                       role: 1,admin: false)
  @nfujieda = User.create!(name: "藤枝成宏", email: "123",
                       password: "nfujieda", password_confirmation: "nfujieda", 
                       role: 1,admin: false)
end

def make_relationships  
  @ayazawa.follow!(@nkomatsu)
  @ytakagi.follow!(@nkomatsu)
  @nosaki.follow!(@nkomatsu)
  @nterashima.follow!(@nkomatsu)
  @sokazaki.follow!(@nkomatsu)
  @tichinose.follow!(@nkomatsu)
  @lserizawa.follow!(@nkomatsu)
  @rhonzyo.follow!(@nkomatsu)
  @nfujieda.follow!(@nkomatsu)

  @ytakagi.follow!(@ayazawa)
  @nosaki.follow!(@ayazawa)
  @nterashima.follow!(@ayazawa)
  @sokazaki.follow!(@ayazawa)
  @tichinose.follow!(@ayazawa)
  @lserizawa.follow!(@ayazawa)
  @rhonzyo.follow!(@ayazawa)
  @nfujieda.follow!(@ayazawa)

  @nosaki.follow!(@ytakagi)
  @nterashima.follow!(@ytakagi)
  @sokazaki.follow!(@ytakagi)

  @lserizawa.follow!(@tichinose)
  @rhonzyo.follow!(@tichinose)
  @nfujieda.follow!(@tichinose)
end

def make_projects
  Project.create!(name: "Food")
  Project.create!(name: "Sports")
  Project.create!(name: "Music")
  Project.create!(name: "History")
  Project.create!(name: "Health")
end

def make_kintais
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-01", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-02", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-03", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-04", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-05", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-06", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-07", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-08", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-09", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-10", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-11", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-12", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-13", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-14", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-15", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-16", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-17", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-18", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-19", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-20", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-21", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-22", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-23", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-24", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-25", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-26", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-27", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-28", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-29", start:"09:00:00", end:"17:30:00")
  Kintai.create!(user_id: @nosaki.id, date: "2015-09-30", start:"09:00:00", end:"17:30:00")
end

def make_assigns
  UserProject.create!(user_id: @nosaki.id, project_id: 1)
  UserProject.create!(user_id: @nosaki.id, project_id: 2)
  UserProject.create!(user_id: @nosaki.id, project_id: 3)
  UserProject.create!(user_id: @nterashima.id, project_id: 2)
  UserProject.create!(user_id: @nterashima.id, project_id: 3)
  UserProject.create!(user_id: @sokazaki.id, project_id: 1)
  UserProject.create!(user_id: @sokazaki.id, project_id: 2)
  UserProject.create!(user_id: @rhonzyo.id, project_id: 4)
  UserProject.create!(user_id: @rhonzyo.id, project_id: 5)
end

def make_jissekis
  u_p = UserProject.where("user_id = ?", @nosaki.id)
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

