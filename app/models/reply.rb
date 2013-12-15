class Reply < ActiveRecord::Base
  belongs_to :product

  validates :name, :email, :content, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only letters" }
  validates :email, :email => true
end
