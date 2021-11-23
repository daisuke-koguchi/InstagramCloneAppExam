class Blog < ApplicationRecord
  validates :title ,presence: true
  validates :content, presence: true
  #写真投稿機能つけた後解除↓
  validates :image,presence:true,  allow_blank: true
end
