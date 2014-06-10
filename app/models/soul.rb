class Soul < ActiveRecord::Base
    validates :name, :description, presence: true
end
