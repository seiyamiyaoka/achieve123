class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
hash[:uid] = User.create_unique_string
super
end
def edit
  @mail = Mail.last
end
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
