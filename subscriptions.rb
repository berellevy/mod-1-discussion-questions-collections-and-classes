
class Subscription
  attr_reader :subscriber, :subscribee
  
  @@all = []
  
# need to check for existing active subscription
  def initialize(hash)
    @subscriber = hash[:subscriber]
    @subscribee = hash[:subscribee]
    @status = "active"
    @@all << self
    @timestamp = Time.now
  end

  def self.all
    @@all
  end

  # need to return the most recent subscription!!!!
  def self.find_subscription(hash) # returns a Subscription instance or nil
    sub = self.all.find { |s| s.subscribee == hash[:subscribee] && s.subscriber == hash[:subscriber] }
    sub ? sub : "subscription not found. maybe you need to look harder, jk"
  end
 
  ## I feel like this function is superfluous

  # def self.subscribed?(hash) # returns an array of the object and a boolean
  #   sub self.find_subscription(subscriber: hash[:subscriber], subscribee: hash[:subscribee])
  #   return [sub.status == active, sub]
  # end

  def self.unsubscribe(hash)
    sub = find_subscription(subscriber: hash[:subscriber], subscribee: hash[:subscribee])
    case sub.status
    when "active"
      sub.status = "canceled"
    when "cancelled"
      puts "You've already unsubscribed, maybe you want to send them some hate mail?"
    end
  end
  

end