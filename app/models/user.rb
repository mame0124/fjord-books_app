# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :file_type

  private
    def file_type
      if !image.blob.content_type.in?(%('image/jpg image/png image/gif'))
        errors.add(:image, 'は JPEG 形式または PNG 形式のみ選択してください')
      end
    end
end
