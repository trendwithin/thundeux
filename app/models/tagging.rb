class Tagging < ActiveRecord::Base
  belongs_to :memory
  belongs_to :tag
end
