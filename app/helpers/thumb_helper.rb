module ThumbHelper
  def square_thumb_url(user, size=100)
    url_for(user.avatar.variant(combine_options: {thumbnail: "#{size}x#{size}^", gravity: "center", extent: "#{size}x#{size}"}))
  end
end
