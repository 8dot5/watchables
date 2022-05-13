class Category < ApplicationRecord
    has_many :watchables, dependent: :destroy
end
