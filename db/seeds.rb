# frozen_string_literal: true

%w[superadmin admin default].each do |rol_name|
  # ROLES
  role = Role.find_or_create_by(name: rol_name, description: "#{rol_name} role")
  # USERS
  user = User.find_or_initialize_by(name: rol_name,
                                    lastname: "#{rol_name} lastname",
                                    email: "#{rol_name}@email.com",
                                    role: role)
  user.password = '12345678'
  user.password_confirmation = '12345678'
  user.save!
end
