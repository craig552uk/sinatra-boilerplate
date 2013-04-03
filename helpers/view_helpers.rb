# encoding: utf-8

module ViewHelpers

  # HTML escape text
  def h(text)
    ERB::Util.html_escape(text)
  end

  # URL encode text
  def u(text)
    ERB::Util.url_encode(text)
  end

  # Format date
  def d(date)
    date.strftime(settings.date_format)
  end

  # Format time
  def t(date)
    date.strftime(settings.time_format)
  end

  # Format date time
  def dt(date)
    date.strftime(settings.date_time_format)
  end

  # Page title
  def title
    @title || settings.title
  end

  # Page description
  def description
    @description || settings.description
  end

  # Useful for setting js in one view and rendering it in another
  def javascript(js=nil)
    @javascript ||= []
    @javascript << js
    @javascript.join("\n")
  end

  # Create alerts with custom classes
  def alert(id, msg, *classes)
    flash[rand(9999).to_s] = {:msg => msg, :classes  => classes}
  end
end