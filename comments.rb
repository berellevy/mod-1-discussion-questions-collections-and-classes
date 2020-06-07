class Comment
  attr_reader :user, :photo, :text

  @@all = []


  def initialize(hash)
    @user = hash[:user]
    @photo = hash[:photo]
    @text = hash[:text]
    @timestamp = Time.now
    @@all << self
  end

  def self.all
    @@all
  end

  


  

end