class Soul < ActiveRecord::Base
    validates :name, :body, presence: true
end
