require 'phantomchain/client/http/client'
require 'phantomchain/client/api/blocks'
require 'phantomchain/client/api/delegates'
require 'phantomchain/client/api/node'
require 'phantomchain/client/api/peers'
require 'phantomchain/client/api/transactions'
require 'phantomchain/client/api/votes'
require 'phantomchain/client/api/wallets'

module PhantomChain
  module Client
    # The connection used to communicate with the API.
    class Connection
      attr_accessor :client

      # Create a new connection instance.
      #
      # @param config [Hash]
      #
      # @return [PhantomChain::Client::Connection]
      def initialize(config, client = nil)
        @host = config[:host]

        raise ArgumentError, 'No API host is provided.' if @host.nil?

        if client.nil? # rubocop:disable Style/ConditionalAssignment
          @client = PhantomChain::Client::HTTP::Client.new(config)
        else
          @client = client.new(config)
        end
      end

      # Return the Blocks API resource.
      #
      # @return [Object]
      def blocks
        @blocks ||= PhantomChain::Client::API::Blocks.new(@client)
      end

      # Return the Delegates API resource.
      #
      # @return [Object]
      def delegates
        @delegates ||= PhantomChain::Client::API::Delegates.new(@client)
      end

      # Return the Node API resource.
      #
      # @return [Object]
      def node
        @node ||= PhantomChain::Client::API::Node.new(@client)
      end

      # Return the Peers API resource.
      #
      # @return [Object]
      def peers
        @peers ||= PhantomChain::Client::API::Peers.new(@client)
      end

      # Return the Transactions API resource.
      #
      # @return [Object]
      def transactions
        @transactions ||= PhantomChain::Client::API::Transactions.new(@client) # rubocop:disable Metrics/LineLength
      end

      # Return the Votes API resource.
      #
      # @return [Object]
      def votes
        @votes ||= PhantomChain::Client::API::Votes.new(@client)
      end

      # Return the Wallets API resource.
      #
      # @return [Object]
      def wallets
        @wallets ||= PhantomChain::Client::API::Wallets.new(@client)
      end
    end
  end
end
