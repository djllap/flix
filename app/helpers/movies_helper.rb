module MoviesHelper
  def format_total_gross(movie)
    if movie.flop?
      content_tag(:strong, 'Flop!')
    else
      number_to_currency(movie.total_gross)
    end
  end

  def image_for(movie)
    if movie.image_file_name.blank?
      image_tag('placeholder.png')
    else
      image_tag(movie.image_file_name)
    end
  end

  def format_average_stars(movie)
    if movie.average_stars.nil?
      content_tag(:strong, 'No reviews')
    else
      image_tag('Gold-Rating-Stars.png', 
                    class: 'average-stars',
                    style: "object-fit: none; width: #{movie.average_stars / 5 * 136}px; height: 27px; object-position: 0 0; float: none; margin: 0; border: none"
                )      
    end
  end

  def format_average_stars_text(movie)
    unless movie.average_stars.nil?
      "#{movie.average_stars.round(1)}/5"
    end
  end

  def delete_review_image
    image_tag('trash.png', style: 'border: 0', title: 'Delete Review')
  end
end
