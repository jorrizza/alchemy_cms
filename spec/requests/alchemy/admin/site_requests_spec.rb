require 'spec_helper'

RSpec.describe 'Site requests' do
  before do
    authorize_user(:as_admin)
  end

  context 'a site with host' do
    let!(:site) { create(:alchemy_site, :public, host: 'alchemy-cms.com') }
    let(:another_site) { Alchemy::Site.default }

    context 'in params' do
      it 'loads dashboard of another site by id' do
        get "http://#{site.host}/admin/dashboard?site_id=#{another_site.id}"
        expect(assigns(:current_alchemy_site).id).to eq(another_site.id)
      end
    end
  end
end
