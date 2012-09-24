class Post < ActiveRecord::Base
  attr_accessible :body, :published, :title, :picture_number

  belongs_to :category
  has_many :comments, :dependent => :destroy
  has_many :trackbacks, :dependent => :destroy
end
