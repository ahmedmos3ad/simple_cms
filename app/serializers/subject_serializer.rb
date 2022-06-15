class SubjectSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :visible, :position
  has_many :pages
end
