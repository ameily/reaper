class Citation < ActiveRecord::Base
  belongs_to :soul
  validates :url, presence: true, :format => URI::regexp(%w(http https))
end
