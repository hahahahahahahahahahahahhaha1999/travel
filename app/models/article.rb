class Article < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture, class_name: 'Prefecture'
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :partner
  belongs_to :travel_site
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  with_options presence: true do
    validates :title, :image, :check_in, :check_out, :partner, :price, :content
  end

  with_options numericality: { other_than: 1 } do
    validates :partner_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999, allow_blank: true },
                    format: { with: /\A[0-9]+\z/, allow_blank: true }
end

