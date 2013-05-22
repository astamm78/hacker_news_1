class User < ActiveRecord::Base

  has_many :posts
  has_many :comments

  include BCrypt

  validates :username, :presence => true,
            :uniqueness => true
  validates :email, :presence => true, :format => {:with =>  /\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3}/},
            :uniqueness => true
  validates :password, :presence => true
  before_save :encrypt

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && Password.new(user.password) == password
      true
    else
      false
    end
  end

  def encrypt
    to_hash = self.password
    self.password = BCrypt::Password.create(to_hash)
  end
end
