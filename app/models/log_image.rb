class LogImage < ApplicationRecord
  belongs_to :log
  attachment :image
end
