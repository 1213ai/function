class HowToMake < ApplicationRecord
  belongs_to :recipe
  attachment :process_image
end
