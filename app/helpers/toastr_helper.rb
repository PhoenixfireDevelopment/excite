# ToastrHelper namespace
module ToastrHelper
  # Helper to create flash messages in layout
  def toastr_flash
    flash_messages = []
    flash.each do |type, message|
      next if type.to_s == 'timedout'
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script type='text/javascript'>toastr.#{type}('#{message}', 'New Alert');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
