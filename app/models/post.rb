class Post < ApplicationItem
  extend ActiveModel::Naming
  include ActiveModel::Validations

  def persisted?
    !self.id.nil?
  end


  column :id, :content, :created_at, :updated_at
  validates :content, presence: true
end
