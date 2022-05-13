class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :service_type, :subscribed

  has_many :watchables
end
