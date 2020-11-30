class Post
  include Dynamoid::Document
  has_many :comments

  field :id
  field :content
  field :created_at
  field :updated_at
  validates :content, presence: true
end


