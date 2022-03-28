class Comment < ApplicationRecord
  belongs_to :course
  belongs_to :participation
end
