module ApplicationHelper
  def show_picture(topic)
    return image_tag(topic.picture) if topic.picture?

    unless topic.picture.blank?
      img_url = topic.picture
    end
    image_tag(img_url)
  end

  def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name)
  end
end
