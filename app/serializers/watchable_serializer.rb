class WatchableSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :summary, :poster_url, :trailer_url, :favorite, :category_id, :user_id, :updated_at

  #:service_id,
  belongs_to :category
  # belongs_to :service
  belongs_to :user
end
