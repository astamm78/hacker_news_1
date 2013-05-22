class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  has_many :commentvotes
  has_many :users, :through => :commentvotes

  validates :content, :presence => :true

end
