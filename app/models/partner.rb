class Partner < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '両親' },
    { id: 3, name: '友人' },
    { id: 4, name: '恋人' },
    { id: 5, name: '会社の同僚' },
    { id: 6, name: '祖父母' },
    { id: 7, name: '兄弟・姉妹' },
    { id: 8, name: '1人' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
end