class Comment < ActiveRecord::Base
  belongs_to :gig
  belongs_to :user

  validates :user, :gig, :body, presence:true

end
