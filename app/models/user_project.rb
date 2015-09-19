class UserProject < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates :user_id,    presence: true
  validates :project_id, presence: true
  has_many :jissekis, dependent: :destroy
end
