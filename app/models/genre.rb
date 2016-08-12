class Genre < ApplicationRecord
  before_validation :generate_slug

  has_many :characterizations, dependent: :destroy
  has_many :movies, through: :characterizations

  validates :name, presence: true, uniqueness: true

  to_param :slug

  def generate_slug
    self.slug ||= name.parameterize if name
  end

  def to_param
    slug
  end
end
