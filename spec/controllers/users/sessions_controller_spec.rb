require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  # describe 'POST #create' do
  #
  # end

  describe 'POST #create_from_saml' do
    before do
      allow(subject).to receive(:post_saml_response) { subject.render nothing: true }
      allow(subject).to receive(:sign_in)
      allow(subject).to receive(:validate_saml_request)
      allow(subject).to receive(:warden) { warden }
      allow(warden).to receive(:authenticate!) { user }

      post :create_from_saml
    end

    let(:user) { FactoryGirl.create(:user) }
    let(:warden) { instance_double(Warden::Proxy) }

    it 'validates the saml request' do
      expect(subject).to have_received(:validate_saml_request)
    end

    it 'authenticates the user' do
      expect(warden).to have_received(:authenticate!).with(subject.send(:auth_options))
    end

    it 'sets the user as the resource' do
      expect(subject.send(:resource)).to eq(user)
    end

    it 'signs in the user' do
      expect(subject).to have_received(:sign_in).with(:user, user)
    end

    it 'posts the saml response' do
      expect(subject).to have_received(:post_saml_response)
    end
  end

  describe 'GET #new_from_saml' do
    context 'when there is a current user' do
      before do
        allow(subject).to receive(:post_saml_response) { subject.render nothing: true }
        allow(subject).to receive(:sign_in)
        allow(subject).to receive(:user_signed_in?) { true }
        allow(subject).to receive(:validate_saml_request)
        allow(subject).to receive(:warden) { warden }
        allow(warden).to receive(:authenticate!) { user }

        get :new_from_saml
      end

      let(:user) { FactoryGirl.create(:user) }
      let(:warden) { instance_double(Warden::Proxy) }

      it 'validates the saml request' do
        expect(subject).to have_received(:validate_saml_request)
      end

      it 'authenticates the user' do
        expect(warden).to have_received(:authenticate!).with(subject.send(:auth_options))
      end

      it 'sets the user as the resource' do
        expect(subject.send(:resource)).to eq(user)
      end

      it 'signs in the user' do
        expect(subject).to have_received(:sign_in).with(:user, user)
      end

      it 'posts the saml response' do
        expect(subject).to have_received(:post_saml_response)
      end
    end

    context 'when there is NOT a current user' do
      before do
        allow(User).to receive(:new) { new_user }
        allow(subject).to receive(:user_signed_in?) { false }
        get :new_from_saml
      end

      let(:new_user) { instance_double(User) }

      it 'sets the resource' do
        expect(User).to have_received(:new).with(subject.send(:sign_in_params))
        expect(subject.send(:resource)).to eq(new_user)
      end

      it 'renders the new action' do
        expect(response).to render_template(:new)
      end
    end
  end
end
