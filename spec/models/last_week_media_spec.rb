require 'rails_helper'

describe InstagramDirectAPI::LastWeekMedia do

  before :each do
    @client = InstagramDirectAPI::Client.new('fake_client_id')
  end

  it 'should fetch last week media for User' do
    @lwm = InstagramDirectAPI::LastWeekMedia::ForUser.new(@client, 'some_user_id')
    expect(@lwm).to respond_to(:fetch)
  end

  def stub_media
    TarvitHelpers::HashPresenter.present({
       data: [],
       pagination: {
           next_max_id: nil
       },
    })
  end
end
