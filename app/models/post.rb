class Post < ApplicationRecord
  belongs_to :participation
  belongs_to :course
end
