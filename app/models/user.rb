class User<ApplicationRecord
  has_many :articles
  validates :username,presence: true,uniqueness:true,length:{minimum:3, maximum:25};
  has_secure_password
end