# coding: utf-8

#
# A collection of patches to add/repair functionality in other classes.
# This file should be required in all init.rb files as it may be used anywhere.

#
# Suppliment Fixnum with handly methods
#
class Fixnum

  def minute;  self        * 60;  end
  def hour;    self.minute * 60;  end
  def day;     self.hour   * 24;  end
  def week;    self.day    * 7;   end
  def month;   self.day    * 30;  end
  def year;    self.day    * 365; end
  def decade;  self.year   * 10;  end
  def century; self.year   * 100; end

  alias_method :minutes,   :minute
  alias_method :hours,     :hour
  alias_method :days,      :day
  alias_method :weeks,     :week
  alias_method :months,    :month
  alias_method :years,     :year
  alias_method :decades,   :decade
  alias_method :centuries, :century
end

#
# Suppliment String with handy methods
#
class String

  # Replace non-ascii chars
  def normalize
    self.tr(
    "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
    "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz")
  end

  # Make string url safe
  def urlize
    self.normalize.downcase.gsub(/[^a-z0-9 ]/,' ').strip.gsub(/\s+/,'-')
  end

  # Produce a unique hash of the string
  # (useful for session keys)
  def uniq_hash
    Digest::SHA2.hexdigest "#{rand}-#{self}-#{Time.now.to_s}"
  end
end