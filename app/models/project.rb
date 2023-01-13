class Project < ApplicationRecord
  has_many :stacks
  has_many :languages, through: :stacks
end
