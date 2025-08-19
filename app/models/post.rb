class Post < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[title body created_at updated_at]
  end
end
