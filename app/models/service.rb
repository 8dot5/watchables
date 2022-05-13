class Service < ApplicationRecord
    has_many :watchables, dependent: :destroy
end
