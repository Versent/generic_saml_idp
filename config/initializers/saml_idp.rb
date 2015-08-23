SamlIdp.configure do |config|
  base = "http://example.com"

  config.x509_certificate = <<-CERT
-----BEGIN CERTIFICATE-----
MIIDqzCCAxSgAwIBAgIBATANBgkqhkiG9w0BAQsFADCBhjELMAkGA1UEBhMCQVUx
DDAKBgNVBAgTA05TVzEPMA0GA1UEBxMGU3lkbmV5MQwwCgYDVQQKDANQSVQxCTAH
BgNVBAsMADEYMBYGA1UEAwwPbGF3cmVuY2VwaXQuY29tMSUwIwYJKoZIhvcNAQkB
DBZsYXdyZW5jZS5waXRAZ21haWwuY29tMB4XDTEyMDQyODAyMjIyOFoXDTMyMDQy
MzAyMjIyOFowgYYxCzAJBgNVBAYTAkFVMQwwCgYDVQQIEwNOU1cxDzANBgNVBAcT
BlN5ZG5leTEMMAoGA1UECgwDUElUMQkwBwYDVQQLDAAxGDAWBgNVBAMMD2xhd3Jl
bmNlcGl0LmNvbTElMCMGCSqGSIb3DQEJAQwWbGF3cmVuY2UucGl0QGdtYWlsLmNv
bTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAuBywPNlC1FopGLYfF96SotiK
8Nj6/nW084O4omRMifzy7x955RLEy673q2aiJNB3LvE6Xvkt9cGtxtNoOXw1g2Uv
HKpldQbr6bOEjLNeDNW7j0ob+JrRvAUOK9CRgdyw5MC6lwqVQQ5C1DnaT/2fSBFj
asBFTR24dEpfTy8HfKECAwEAAaOCASUwggEhMAkGA1UdEwQCMAAwCwYDVR0PBAQD
AgUgMB0GA1UdDgQWBBQNBGmmt3ytKpcJaBaYNbnyU2xkazATBgNVHSUEDDAKBggr
BgEFBQcDATAdBglghkgBhvhCAQ0EEBYOVGVzdCBYNTA5IGNlcnQwgbMGA1UdIwSB
qzCBqIAUDQRpprd8rSqXCWgWmDW58lNsZGuhgYykgYkwgYYxCzAJBgNVBAYTAkFV
MQwwCgYDVQQIEwNOU1cxDzANBgNVBAcTBlN5ZG5leTEMMAoGA1UECgwDUElUMQkw
BwYDVQQLDAAxGDAWBgNVBAMMD2xhd3JlbmNlcGl0LmNvbTElMCMGCSqGSIb3DQEJ
AQwWbGF3cmVuY2UucGl0QGdtYWlsLmNvbYIBATANBgkqhkiG9w0BAQsFAAOBgQAE
cVUPBX7uZmzqZJfy+tUPOT5ImNQj8VE2lerhnFjnGPHmHIqhpzgnwHQujJfs/a30
9Wm5qwcCaC1eO5cWjcG0x3OjdllsgYDatl5GAumtBx8J3NhWRqNUgitCIkQlxHIw
UfgQaCushYgDDL5YbIQa++egCgpIZ+T0Dj5oRew//A==
-----END CERTIFICATE-----
CERT

  config.secret_key = <<-CERT
-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQC4HLA82ULUWikYth8X3pKi2Irw2Pr+dbTzg7iiZEyJ/PLvH3nl
EsTLrverZqIk0Hcu8Tpe+S31wa3G02g5fDWDZS8cqmV1Buvps4SMs14M1buPShv4
mtG8BQ4r0JGB3LDkwLqXCpVBDkLUOdpP/Z9IEWNqwEVNHbh0Sl9PLwd8oQIDAQAB
AoGAQmUGIUtwUEgbXe//kooPc26H3IdDLJSiJtcvtFBbUb/Ik/dT7AoysgltA4DF
pGURNfqERE+0BVZNJtCCW4ixew4uEhk1XowYXHCzjkzyYoFuT9v5SP4cu4q3t1kK
51JF237F0eCY3qC3k96CzPGG67bwOu9EeXAu4ka/plLdsAECQQDkg0uhR/vsJffx
tiWxcDRNFoZpCpzpdWfQBnHBzj9ZC0xrdVilxBgBpupCljO2Scy4MeiY4S1Mleel
CWRqh7RBAkEAzkIjUnllEkr5sjVb7pNy+e/eakuDxvZck0Z8X3USUki/Nm3E/GPP
c+CwmXR4QlpMpJr3/Prf1j59l/LAK9AwYQJBAL9eRSQYCJ3HXlGKXR6v/NziFEY7
oRTSQdIw02ueseZ8U89aQpbwFbqsclq5Ny1duJg5E7WUPj94+rl3mCSu6QECQBVh
0duY7htpXl1VHsSq0H6MmVgXn/+eRpaV9grHTjDtjbUMyCEKD9WJc4VVB6qJRezC
i/bT4ySIsehwp+9i08ECQEH03lCpHpbwiWH4sD25l/z3g2jCbIZ+RTV6yHIz7Coh
gAbBqA04wh64JhhfG69oTBwqwj3imlWF8+jDzV9RNNw=
-----END RSA PRIVATE KEY-----
CERT

  # config.password = "secret_key_password"
  # config.algorithm = :sha256
  config.organization_name = "Versent"
  # config.organization_url = "http://example.com"
  # config.base_saml_location = "#{base}/saml"
  # config.reference_id_generator                   # Default: -> { UUID.generate }
  # config.attribute_service_location = "#{base}/saml/attributes"
  # config.single_service_post_location = "#{base}/saml/auth"

  # Principal is passed in when you `encode_response`
  #
  # config.name_id.formats # =>
  #   {                         # All 2.0
  #     email_address: -> (principal) { principal.email_address },
  #     transient: -> (principal) { principal.id },
  #     persistent: -> (p) { p.id },
  #   }
  #   OR
  #
  config.name_id.formats = {
      "1.1" => {
        email_address: -> (principal) { principal.email },
      },
      "2.0" => {
        transient: -> (principal) { principal.email },
        persistent: -> (p) { p.id },
      },
    }

  # config.attributes # =>
  #   {
  #     <friendly_name> => {                                                  # required (ex "eduPersonAffiliation")
  #       "name" => <attrname>                                                # required (ex "urn:oid:1.3.6.1.4.1.5923.1.1.1.1")
  #       "name_format" => "urn:oasis:names:tc:SAML:2.0:attrname-format:uri", # not required
  #       "getter" => ->(principal) {                                         # not required
  #         principal.get_eduPersonAffiliation                                # If no "getter" defined, will try
  #       }                                                                   # `principal.eduPersonAffiliation`, or no values will
  #    }                                                                      # be output
  #
  ## EXAMPLE ##
  # config.attributes = {
  #   GivenName: {
  #     getter: :first_name,
  #   },
  #   SurName: {
  #     getter: :last_name,
  #   },
  # }
  ## EXAMPLE ##

  # config.technical_contact.company = "Example"
  # config.technical_contact.given_name = "Jonny"
  # config.technical_contact.sur_name = "Support"
  # config.technical_contact.telephone = "55555555555"
  # config.technical_contact.email_address = "example@example.com"

  service_providers = {
    "some-issuer-url.com/saml" => {
      fingerprint: "9E:65:2E:03:06:8D:80:F2:86:C7:6C:77:A1:D9:14:97:0A:4D:F4:4D",
      metadata_url: "http://some-issuer-url.com/saml/metadata"
    },
  }

  # `identifier` is the entity_id or issuer of the Service Provider,
  # settings is an IncomingMetadata object which has a to_h method that needs to be persisted
  config.service_provider.metadata_persister = ->(identifier, settings) {
    fname = identifier.to_s.gsub(/\/|:/,"_")
    `mkdir -p #{Rails.root.join("cache/saml/metadata")}`
    File.open Rails.root.join("cache/saml/metadata/#{fname}"), "r+b" do |f|
      Marshal.dump settings.to_h, f
    end
  }

  # `identifier` is the entity_id or issuer of the Service Provider,
  # `service_provider` is a ServiceProvider object. Based on the `identifier` or the
  # `service_provider` you should return the settings.to_h from above
  config.service_provider.persisted_metadata_getter = ->(identifier, service_provider){
    fname = identifier.to_s.gsub(/\/|:/,"_")
    `mkdir -p #{Rails.root.join("cache/saml/metadata")}`
    full_filename = Rails.root.join("cache/saml/metadata/#{fname}")
    if File.file?(full_filename)
      File.open full_filename, "rb" do |f|
        Marshal.load f
      end
    end
  }

  # Find ServiceProvider metadata_url and fingerprint based on our settings
  config.service_provider.finder = ->(issuer_or_entity_id) do
    service_providers[issuer_or_entity_id]
  end
end
