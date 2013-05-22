class Post < ActiveRecord::Base

  belongs_to :user
  has_many :postvotes
  has_many :comments
  has_many :users, :through => :comments
  has_many :voters, :through => :postvotes, :source => :user

  validates :title, :presence => true
  validates :url, :presence => true

  def self.title(url)
    post = Nokogiri::HTML(open(url))
    return post.search('title').inner_text
  end

end
