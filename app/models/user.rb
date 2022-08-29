class User<ApplicationRecord
  has_many :articles
  has_many :comments
  has_one_attached :avatar
  validates :username,presence: true,uniqueness:true,length:{minimum:3, maximum:25};
  has_secure_password

end