module ApplicationHelper
  def show_picture(topic)
    return image_tag(topic.picture) if topic.picture?

    unless topic.picture.blank?
      img_url = topic.picture
    end
    image_tag(img_url)
  end
end
