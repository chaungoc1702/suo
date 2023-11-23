class Lesson
  include Mongoid::Document

  field :name, type: String
  field :code, type: String
  field :title, type: String
  field :description, type: String

  belongs_to :level
end