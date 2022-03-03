class Article < ApplicationRecord
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories

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


