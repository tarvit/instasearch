require 'rails_helper'

describe InstagramDirectAPI::LastWeekMedia do

  before :each do
    @client = InstagramDirectAPI::Client.new('fake_client_id')
  end

  it 'should fetch last week media for User' do
    expect(@client).to receive(:media)
    @lwm = InstagramDirectAPI::LastWeekMedia.new(@client, 'some_user_id')
    @lwm.fetch
  end

end
