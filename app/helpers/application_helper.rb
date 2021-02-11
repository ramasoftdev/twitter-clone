module ApplicationHelper
  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      # p "Entre aqui #{message} #{type}"
      type = "success" if type == "notice"
      type = "danger" if (type == "error" || type == "alert")
      text = "<div class='alert alert-#{type} alert-dismissible fade show' role='alert'>"
      text += "<strong>#{message}</strong>"
      text += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>"
      text += "<span aria-hidden='true'>&times;</span>"
      text += "</button>"
      text += "</div>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end
end
