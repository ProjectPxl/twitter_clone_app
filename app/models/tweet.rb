class Tweet < ActiveRecord::Base

  default_scope {order('created_at DESC')}

	belongs_to :member

	validates :content, length: {maximum: 140}
end
