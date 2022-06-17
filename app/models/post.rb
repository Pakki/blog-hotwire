class Post < ApplicationRecord
  validates_presence_of :title
  has_rich_text :content
  has_many :comments, dependent: :destroy

  scope :search_by_title, -> (search_phrase) { where('title LIKE ?', "%#{search_phrase}%") }
end
