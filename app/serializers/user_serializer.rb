class UserSerializer
  include JSONAPI::Serializer
  attributes :username

  attribute :id , if: Proc.new {|record,params|
    params[:id]
  }
  
  attribute :token, if: Proc.new{|record,params| params[:token]} do |object,params|
      params[:token]
    end
end
