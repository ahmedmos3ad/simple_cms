class UserSerializer
  include JSONAPI::Serializer
  attributes :username

  attribute :token do |user,params|
    params[:token]
  end
end
