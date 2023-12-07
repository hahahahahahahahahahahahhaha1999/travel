class Article < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :partner
  belongs_to :travel_site

  with_options presence: true do
    validates :title, :images, :check_in, :check_out, :partner, :price, :content
  end

  validates :images, length: { minimum: 1, maximum: 3, allow_blank: true}

  with_options numericality: { other_than: 1 } do
    validates :partner_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999, allow_blank: true },
                    format: { with: /\A[0-9]+\z/, allow_blank: true }
end

