class Review < ApplicationRecord
<<<<<<< HEAD
=======
  validates :name, presence: true
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1

  validates :comment, length: { minimum: 4 }

  STARS = [1, 2, 3, 4, 5]

  validates :stars, inclusion: {
    in: STARS,
    message: "must be between 1 and 5"
  }
  
  belongs_to :movie
<<<<<<< HEAD
  belongs_to :user
=======
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
end
