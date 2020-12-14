# BootstrapFlashHelper namespace
module BootstrapFlashHelper
  # The known types of alerts for rails flash messages and bootrap alert classes
  ALERT_TYPES = %i[danger info success warning].freeze unless const_defined?(:ALERT_TYPES)

  # Helper to create flash messages in layout
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?
      next if type.to_s == :timedout.to_s

      type = type.to_sym
      type = :success if type.to_s == :notice.to_s
      type = :danger if type.to_s == :error.to_s
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw('&times;'), class: 'close', 'data-dismiss' => 'alert') +
                           msg, role: 'alert', class: "alert alert-dismissable fade show in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end
