class Status < ApplicationRecord
  belongs_to :user, optional: true
end
