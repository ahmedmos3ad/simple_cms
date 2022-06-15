class UserSerializer
  include JSONAPI::Serializer
  attributes :username

  attribute :token do |object,params|
    params[:token]
  end
end
