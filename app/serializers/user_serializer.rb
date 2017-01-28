class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :nationality, :sex, :type
end
