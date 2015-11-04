require 'rails_helper'

describe InstagramDirectAPI::Client do

  before :each do
    @client = InstagramDirectAPI::Client.new('fake_cliend_id')
  end

  it 'should search tags' do
    url = 'https://api.instagram.com/v1/tags/search?q=awesome&client_id=fake_cliend_id'
    expect(@client.search_url(:tags, 'awesome')).to eq(url)

    expect(@client).to receive(:request).with(url)
    expect(@client.search(:tags, 'awesome'))
  end

  it 'should search users' do
    url = 'https://api.instagram.com/v1/users/search?q=john&client_id=fake_cliend_id'
    expect(@client.search_url(:users, 'john')).to eq(url)

    expect(@client).to receive(:request).with(url)
    expect(@client.search(:users, 'john'))
  end

end

