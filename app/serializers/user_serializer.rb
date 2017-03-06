class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :avatar, :following

  def following
    current_user.follows?(object) if current_user && object != current_user
  end

end
