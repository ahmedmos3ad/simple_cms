class UserSerializer
  include JSONAPI::Serializer
  attributes :username

  attribute :id , if: Proc.new {|record,params| params[:id]==true}
  attribute :token, if: Proc.new{|record,params| params[:token]} do |record,params|
      params[:token]
    end
  attribute :email, if: Proc.new {|record,params| params[:email]==true}
end
