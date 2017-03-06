class UserExpandedSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :bio, :avatar, :token
end
