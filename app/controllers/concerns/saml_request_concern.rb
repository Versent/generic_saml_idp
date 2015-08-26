module SamlRequestConcern
  extend ActiveSupport::Concern

  def build_saml_request!(service_provider)
    request_document = OneLogin::RubySaml::Authrequest.new.create_authentication_xml_doc(
      saml_settings(service_provider)
    )
    self.saml_request = SamlIdp::Request.new(request_document.to_s)
  end

  def post_saml_response(user = nil)
    user = user ? user : current_user
    @saml_response = encode_response OpenStruct.new(response_hash(user))
    render template: 'saml_idp/idp/saml_post', layout: false
  end

  private

  def idp_settings
    OneLogin::RubySaml::Settings.new(
      idp_cert: SamlIdp.config.x509_certificate,
      idp_entity_id: SamlIdp.config.base_saml_location,
      idp_sso_target_url: SamlIdp.config.single_service_post_location
    )
  end

  def response_hash(user)
    [:name, :url, :company, :email, :id].each_with_object({}) do |accessor, hash|
      hash[accessor] = user.send(accessor) if user.respond_to? accessor
    end
  end

  def saml_settings(service_provider)
    configured_service_provider = SamlIdp::ServiceProvider.new(
      SamlIdp.config.service_provider.finder[service_provider]
    )

    settings = idp_settings
    settings.assertion_consumer_service_url = service_provider
    settings.issuer = configured_service_provider.metadata_url
    settings
  end
end
