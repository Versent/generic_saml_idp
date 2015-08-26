class Users::SessionsController < Devise::SessionsController
  # before_filter :configure_sign_in_params, only: [:create]

  include SamlIdp::Controller
  include SamlRequestConcern

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)

    redirect_to_sp_initiator
  end

  # POST /saml/auth
  def create_from_saml
    process_saml_request
  end

  # GET /saml/auth
  def new_from_saml
    if user_signed_in?
      process_saml_request
    else
      self.resource = resource_class.new(sign_in_params)
      render action: 'new'
    end
  end

  protected

  def process_saml_request
    validate_saml_request
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    post_saml_response
  end

  def redirect_to_sp_initiator
    if params[:SAMLRequest].present?
      self.saml_request = SamlIdp::Request.from_deflated_request(params[:SAMLRequest])
      post_saml_response
    else
      redirect_to root_path # this in turn redirects to the default SP
    end
  end
end
