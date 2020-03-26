class Topic < ApplicationRecord
  # dependent: :destroy指定で、topicを削除した際に関連づいている項目(topicに関連付いたpost)も同時に削除する
  has_many :posts, dependent: :destroy
end
