# there is definitely a way to make a helper metthod to access
# all objects related to this object thru another object!!!


class User
  attr_accessor :attribute_name
  attr_reader :account_number

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @account_number = self.class.count
  end

  def self.pick_random
    self.all.shuffle[0]
  end
  
  
  def self.all
    @@all
  end
  
  def self.count
    all.count
  end

  def photos
    Photo.all.select { |p| p.user == self }  
  end
  
  def photos_comments
    photos.map { |p| p.comments }
  end

  def photo_comment_users
    photo_comments.map { |c| c.user}
  end
  

  def comments
    Comment.all.select { |c| c.user == self }
  end
  
  def comments_photos
    comments.map { |c| c.photo }
  end

  def add_comment(hash)
    hash[:photo].add_comment(user: self, text: hash[:text])
    
  end
  
  
  
  def add_photo(title)
    Photo.new(user: self, title: title)
  end

  def subscribe(user) ### check for existing subscription first!!!!
    Subscription.new(subscriber: self, subscribee: user)
  end
  
  
  def subscribers
    Subscription.all.select { |s| s.subscribee == self }.map do |s|
      s.subscriber
    end
  end
  
  def subscribed_to
    Subscription.all.select { |s| s.subscriber == self }.map do |s|
      s.subscribee
    end
  end
  
  def subscribed_to_photos
    subscribed_to.photos
  end
    
end