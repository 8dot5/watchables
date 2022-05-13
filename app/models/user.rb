class User < ApplicationRecord
    has_secure_password
    has_many :watchables
    has_many :categories, through: :watchables
    has_many :services, through: :watchables

    validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true

    # custom validation
    # validate :must_have_preferred_email

    # private
    # def must_have_preferred_email
    #     unless email.match?(/chun.codes|chunyi.dev|gmail.com/)
    #         errors.add(:email, "Sorry, we only allow specific email providers.")
    #     end
    # end
end
