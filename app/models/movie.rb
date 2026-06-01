class Movie < ApplicationRecord
  CLASSIFICATIONS = %w[邦画 洋画 アニメ].freeze
  CATEGORIES = %w[アクション ラブストーリー サスペンス コメディ ホラー].freeze
  MOODS = %w[楽しい 泣ける 笑える 悲しい リアル].freeze

  validates :title, :classification, :category, :mood, :overview, presence: true
  validates :classification, inclusion: { in: CLASSIFICATIONS }
  validates :category, inclusion: { in: CATEGORIES }
  validates :mood, inclusion: { in: MOODS }

  scope :by_classification, ->(v) { v.present? ? where(classification: v) : all }
  scope :by_category,       ->(v) { v.present? ? where(category: v) : all }
  scope :by_mood,           ->(v) { v.present? ? where(mood: v) : all }
end
