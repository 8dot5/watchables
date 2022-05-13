class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email


  has_many :watchables
  has_many :categories, through: :watchables
end
