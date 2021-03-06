class Post < ActiveRecord::Base
  attr_accessible :body, :published, :title, :picture_number, :category

  belongs_to :category
  has_many :comments, :dependent => :destroy
  has_many :trackbacks, :dependent => :destroy
end
