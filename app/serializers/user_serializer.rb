class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :nationality, :sex, :user_type
end
