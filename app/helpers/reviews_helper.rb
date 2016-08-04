module ReviewsHelper

  def show_stars(review)
        image_tag("Gold-Rating-Stars.png", 
            class: "stars",
            style: "float: none; margin: 0; border: none; object-fit: none; width: 136px; height: 27px; object-position: 0 #{-27.3 * (5 - review.stars)}px")
                  
  end
end
