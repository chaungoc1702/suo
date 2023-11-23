class VocabularyItem
  include Mongoid::Document

  field :furigana,    type: String
  field :romaji,      type: String
  field :kanji,       type: String
  field :vi_meaning,  type: String
  field :vi_examples, type: String

  belongs_to :lesson
end
