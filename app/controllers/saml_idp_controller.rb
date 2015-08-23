class SamlIdpController < SamlIdp::IdpController
  before_filter :authenticate_user!, except: [:show]

  # override create and make sure to set both "GET" and "POST" requests to /saml/auth to #create
  def create
    if user_signed_in?
      @saml_response = idp_make_saml_response(current_user)
      render :template => "saml_idp/idp/saml_post", :layout => false
      return
    else
      # it shouldn't be possible to get here, but lets render 403 just in case
      render :status => :forbidden
    end
  end

  # NOT USED -- def idp_authenticate(email, password) -- NOT USED

  def idp_make_saml_response(found_user) # not using params intentionally
    logger.debug "Found User: #{found_user}"
    encode_response found_user
  end
  private :idp_make_saml_response
end
