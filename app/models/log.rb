class Log < ApplicationRecord
  belongs_to :user
  has_many :log_images, dependent: :destroy
  accepts_attachments_for :log_images, attachment: :image
  enum brew: { ハンドドリップ:0, コールドブリュー（水出し）:1, フレンチプレス:2, エスプレッソ:3, その他:4 }
  enum roast: { 浅煎り:0, 中浅煎り:1, 中煎り:2, 中深煎り:3, 深煎り:4 }
  enum taste: { 酸味が強い:0, やや酸味が強い:1, バランス:2, やや苦味が強い:3, 苦味が強い:4 }
  enum body: { フルボディ（コクが強い）:0, ミディアムボディ（程よいコク）:1, ライトボディ（すっきり）:2 }
end
