class Photo
  attr_accessor :title
  attr_reader :user

  @@all = []

  def initialize(hash)
    @user = hash[:user]
    @title = hash[:title]
    @@all << self
  end

  # putting this by a user. revised: user will call this method

  def add_comment(hash)
    Comment.new(photo: self, text: hash[:text], user: hash[:user])
  end
  
  
  def user_name
    user.name
  end
  

  def comments
    Comment.all.select { |cmt| cmt.photo == self }
  end

  def comment_users
    comments.map { |c| c.user}
  end
  

  def self.all
    @@all
  end

  def self.pick_random
    self.all.shuffle[0]
  end
  
  

end