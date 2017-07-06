class Universe < ActiveRecord::Base
  has_many :users
end

class Power < ActiveRecord::Base
  has_many :users
end

class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  belongs_to :power
  def full_name
    "#{first_name} #{last_name}".strip
  end
end 

class Post <ActiveRecord::Base
  belongs_to :user
  has_many :comments
end


class Comment <ActiveRecord::Base
  belongs_to  :post
  belongs_to :user
end
