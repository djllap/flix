module ApplicationHelper
<<<<<<< HEAD
  def page_title
    if content_for?(:title)
      "Flix - #{content_for(:title)}"
    else
      "Flix"
    end
  end

  def title(title)
    content_for(:title, title)
  end
=======
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
end
