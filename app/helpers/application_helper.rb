module ApplicationHelper
  def nav_class(controller)
    name = 'nav-link'

    name += ' nav-link--active' if params[:controller] == controller

    name
  end

  def image_srcset_tag(source, srcset = {}, options = {})
    srcset = srcset.map { |size, src| "#{asset_path(src)} #{size}" }.join(', ')
    image_tag(source, options.merge(srcset: srcset))
  end

  def name(user)
    render(partial: 'name', locals: { user: user })
  end

  def repliable_path(post)
    type = post.is_a?(Post) ? 'post' : 'reply'
    new_reply_path(parent_type: type, parent_id: post.id)
  end
end
