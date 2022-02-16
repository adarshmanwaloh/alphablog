class Article < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    scope :with_long_title, -> { where("LENGTH(title) > 5") }

end



# belongs_to
# has_one
# has_many
# has_one :through
# has_many :through
# has_and_belongs_to_many


