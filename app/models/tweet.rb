class Tweet < ActiveRecord::Base

	default_scope order: 'createdat DESC'
	#attr_accessible = content,user_id
	belongs_to :member

	validates :content, length: {maximum: 140}
end
