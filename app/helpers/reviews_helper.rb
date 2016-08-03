module ReviewsHelper

  def show_stars(review)
    if review.stars == 1
        image_tag("Gold-Rating-Stars.png", class: "one-star")
    elsif review.stars == 2
        image_tag("Gold-Rating-Stars.png", class: "two-star")
    elsif review.stars == 3
        image_tag("Gold-Rating-Stars.png", class: "three-star")
    elsif review.stars == 4
        image_tag("Gold-Rating-Stars.png", class: "four-star")
    elsif review.stars == 5
        image_tag("Gold-Rating-Stars.png", class: "five-star")
    end               
  end
end
