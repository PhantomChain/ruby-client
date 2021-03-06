describe PhantomChain::Client::API::Transactions do
  before(:each) do
    get_connection
  end

  describe '.all' do
    it 'should be ok' do
      response = @connection.transactions.all
      expect(response.url).to eq("#{@host}/transactions")
      expect(response.body['success']).to be_truthy
    end
  end

  describe '.create' do
    it 'should be ok' do
      response = @connection.transactions.create(id: 'dummy')
      expect(response.url).to eq("#{@host}/transactions")
      expect(response.body['success']).to be_truthy
    end
  end

  describe '.show' do
    it 'should be ok' do
      response = @connection.transactions.show('dummy')
      expect(response.url).to eq("#{@host}/transactions/dummy")
      expect(response.body['success']).to be_truthy
    end
  end

  describe '.all_unconfirmed' do
    it 'should be ok' do
      response = @connection.transactions.all_unconfirmed
      expect(response.url).to eq("#{@host}/transactions/unconfirmed")
      expect(response.body['success']).to be_truthy
    end
  end

  describe '.show_unconfirmed' do
    it 'should be ok' do
      response = @connection.transactions.show_unconfirmed('dummy')
      expect(response.url).to eq("#{@host}/transactions/unconfirmed/dummy")
      expect(response.body['success']).to be_truthy
    end
  end

  describe '.search' do
    it 'should be ok' do
      response = @connection.transactions.search(id: 'dummy')
      expect(response.url).to eq("#{@host}/transactions/search")
      expect(response.body['success']).to be_truthy
    end
  end

  describe '.types' do
    it 'should be ok' do
      response = @connection.transactions.types
      expect(response.url).to eq("#{@host}/transactions/types")
      expect(response.body['success']).to be_truthy
    end
  end
end
