# Excite namespace
module ApplicationHelper
  # Title helper
  def title(page_title, show_sub_title = true, options = {})
    content_for(:title) { page_title }

    fa_icon = options.slice(:fa_icon)
    sub_title(page_title, fa_icon) if show_sub_title
  end

  # Sub title for icon
  def sub_title(sub_title, options = {})
    content_for(:sub_title) { sub_title }
    fa_icon = options.slice(:fa_icon)
    content_for(:fa_icon) { fa_icon[:fa_icon] } if fa_icon.present?
  end

  # Safe localization for time
  def pl(datetime, options = {})
    datetime = Time.zone.parse(datetime) if datetime.is_a?(String)

    unavailable = options.try(:[], :na)
    unavailable ||= 'N/A'
    if datetime.present?
      I18n.l(datetime, options.slice(:format))
    else
      unavailable
    end
  end

  # Embed a youtube url
  def embed(youtube_url)
    youtube_id = youtube_url.split('=').last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

  # Create a boolean indicator
  def boolean_indicator(model, boolean_attribute)
    my_string = ''
    my_string = if model.send("#{boolean_attribute}?".to_sym)
                  '.btn.btn-success.btn-sm Yes'
                else
                  '.btn.btn-danger.btn-sm No'
                end
    Slim::Template.new { my_string }.render.html_safe
  end
end
