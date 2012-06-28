class Murmur < ActiveRecord::Base
  attr_accessible :content, :generated_url

  before_save :generate_url

  private
  def generate_url
    self.generated_url = random_string
  end

  def random_string(string_length = 10)
    string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    tmp    = ''
    string_length.times{ tmp << string[rand(string.size)] }
    tmp
  end
end
