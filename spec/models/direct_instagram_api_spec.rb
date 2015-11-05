require 'rails_helper'

describe InstagramDirectAPI::Client do

  before :each do
    @client = InstagramDirectAPI::Client.new('fake_cliend_id')
  end

  context 'Tags Search' do

    it 'should search tags' do
      url = 'https://api.instagram.com/v1/tags/search?q=awesome&client_id=fake_cliend_id'
      expect(@client).to receive(:request).with(url)
      @client.search(:tags, 'awesome')
    end

  end

  context 'Users Search' do

    it 'should search users' do
      url = 'https://api.instagram.com/v1/users/search?q=john&client_id=fake_cliend_id'
      expect(@client).to receive(:request).with(url)
      @client.search(:users, 'john')
    end

  end

  context 'User Info' do

    it 'should query basic user info' do
      url = 'https://api.instagram.com/v1/users/neo/?client_id=fake_cliend_id'
      expect(@client).to receive(:request).with(url)
      @client.user('neo')
    end

  end

  context 'User Media' do

    it 'should query user media' do
      url = 'https://api.instagram.com/v1/users/neo/media/recent/?client_id=fake_cliend_id&max_id=10'
      expect(@client).to receive(:request).with(url)
      @client.media('neo', { max_id: 10 })
    end

  end

end

