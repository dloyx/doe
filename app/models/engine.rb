class Engine < ActiveRecord::Base
    
    belongs_to:user
    has_many :photos
    has_many :saves
    
    validates :engine_name, presence: true, length: {maximum: 25}
    validates :engine_description, presence: false, length: {maximum: 600}
    validates :engine_identity, presence: true, length: {maximum: 75}
    validates :engine_define, presence: true
	
end