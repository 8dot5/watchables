class Watchable < ApplicationRecord
    belongs_to :category
    belongs_to :user
    # belongs_to :service

    #TODO validation for title, etc.
    validates :title, presence: true
    # validates :summary, presence: true
    validates :rating, presence: true

    #foreign
    validates :category_id, presence: true
    validates :user_id, presence: true
end
