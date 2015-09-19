class Project < ActiveRecord::Base
  has_many :user_projects, foreign_key: "project_id", dependent: :destroy

end
