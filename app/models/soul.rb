class Soul < ActiveRecord::Base
    validates :name, :description, presence: true
    has_many :comments
    has_many :citations
    has_many :attachments
end
