class TravelSite < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'JTB' },
    { id: 3, name: '日本旅行' },
    { id: 4, name: 'H.I.S' },
    { id: 5, name: '楽天トラベル' },
    { id: 6, name: 'じゃらんnet' },
    { id: 7, name: '阪急交通社' },
    { id: 8, name: 'るるぶ.com' },
    { id: 9, name: 'Yahoo!トラベル' },
    { id: 10, name: 'クラブツーリズム' },
    { id: 11, name: '近畿日本ツーリスト' },
    { id: 12, name: '一休.com' },
    { id: 13, name: 'Booking.com' },
    { id: 14, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
end