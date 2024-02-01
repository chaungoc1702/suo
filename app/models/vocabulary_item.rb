class VocabularyItem
  include Mongoid::Document

  field :furigana,    type: String
  field :romaji,      type: String
  field :kanji,       type: String
  field :vi_kanji,    type: String
  field :vi_meaning,  type: String
  field :memo,        type: String

  embeds_many :vocabulary_examples

  belongs_to :lesson
end
