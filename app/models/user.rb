# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :file_type

  private

  def file_type
    return if image.blob.content_type.in?(%('image/jpg image/jpeg image/png image/gif'))

    errors.add(:image, 'は JPEG、PNG、GIF形式のみ選択してください')
  end
end
