class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published, :picture_number
  # There's no 'belongs_to'
  has_one :category
  has_many :comments
  has_many :trackbacks

end
