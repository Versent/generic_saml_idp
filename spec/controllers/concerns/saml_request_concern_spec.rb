require 'rails_helper'

RSpec.describe SamlRequestConcern do
  before do
    class FakesController < SamlIdp::IdpController
      include SamlRequestConcern

      attr_reader :saml_response
    end
  end

  after do
    Object.send :remove_const, :FakesController
  end

  let(:subject) { FakesController.new }

  describe '#build_saml_request!' do
    let(:result) { subject.build_saml_request!('http://test-service-provider.example.com/saml/acs') }

    context 'creates a saml request' do
      it 'with the assertion consumer service url set' do
        expect(result.acs_url).to eq('http://test-service-provider.example.com/saml/acs')
      end

      it 'that is valid' do
        expect(result.valid?).to eq(true)
      end

      # it 'with the service provider' do
      #   expect(result.service_provider.identifier).to eq('http://test-service-provider.example.com/saml/metadata')
      # end

      # it 'with the issuer' do
      #   expect(result.issuer).to eq('http://test-service-provider.example.com/saml/metadata')
      # end
    end
  end

  describe '#post_saml_response' do
    before do
      allow(OpenStruct).to receive(:new) { user_ostruct }
      allow(subject).to receive(:encode_response).with(user_ostruct) { saml_response }
      allow(subject).to receive(:render).with(template: 'saml_idp/idp/saml_post', layout: false)
    end

    let(:user_ostruct) { instance_double(OpenStruct) }
    let(:saml_request) { instance_double(SamlIdp::Request) }
    let(:saml_response) { instance_double(SamlIdp::SamlResponse) }

    context 'provided a user' do
      before do
        subject.post_saml_response(user)
      end

      let(:user) { FactoryGirl.create(:user) }

      it 'creates an open struct with the current user' do
        expect(OpenStruct).to have_received(:new).with(
          name: user.name,
          url: user.url,
          email: user.email,
          company: user.company,
          id: user.id
        )
      end

      it 'renders the saml post template' do
        expect(subject).to have_received(:render).with(template: 'saml_idp/idp/saml_post', layout: false)
      end
    end

    context 'not provided a user' do
      before do
        allow(subject).to receive(:current_user) { current_user }
        subject.post_saml_response
      end

      let(:current_user) { FactoryGirl.create(:user) }

      it 'creates an open struct with the current user' do
        expect(OpenStruct).to have_received(:new).with(
          name: current_user.name,
          url: current_user.url,
          email: current_user.email,
          company: current_user.company,
          id: current_user.id
        )
      end

      it 'renders the saml post template' do
        expect(subject).to have_received(:render).with(template: 'saml_idp/idp/saml_post', layout: false)
      end
    end
  end
end
