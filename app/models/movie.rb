class Movie < ApplicationRecord
<<<<<<< HEAD
  before_validation :generate_slug
  
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations

  validates :released_on, :duration, presence: true
  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
=======
  validates :title, :released_on, :duration, presence: true

  validates :description, length: { minimum: 25 }

  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
  validates :image_file_name, allow_blank: true, format: {
    with:    /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
<<<<<<< HEAD
  validates :title, presence: true, uniqueness: true
  validates :slug, uniqueness: true

=======
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1

  RATINGS = %w(G PG PG-13 R NC-17 NR X)

  validates :rating, inclusion: { in: RATINGS }

<<<<<<< HEAD
  scope :released, -> { where("released_on <= ?", Time.now).order(released_on: :desc) }
  scope :hits, -> { released.where('total_gross >= 300000000').order(total_gross: :desc) }
  scope :flops, -> { released.where('total_gross < 50000000').order(total_gross: :asc) }
  scope :upcoming, -> { where("released_on > ?", Time.now).order(released_on: :asc) }
  scope :rated, ->(rating) { where("rating == ?", rating).order(released_on: :desc) }
  scope :recent, ->(num=5) { released.limit(num) }
=======
  has_many :reviews, dependent: :destroy

  def self.released
    where("released_on <= ?", Time.now).order("released_on desc")
  end

  def self.hits
    where('total_gross >= 300000000').order(total_gross: :desc)
  end

  def self.flops
    where('total_gross < 50000000').order(total_gross: :asc)
  end
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1

  def self.recently_added
    order('created_at desc').limit(3)
  end

  def flop?
    (total_gross.blank? || total_gross < 50000000) && (reviews.count < 50 || reviews.average(:stars) < 4.0)
  end

  def average_stars
    reviews.average(:stars)
  end

  def recent_reviews
  reviews.order('created_at desc').limit(2)
  end
<<<<<<< HEAD

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= title.parameterize if title
  end
=======
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
end
