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
end
