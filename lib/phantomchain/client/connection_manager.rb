require 'phantomchain/client/connection'

module PhantomChain
  module Client
    # Manager that holds all connections
    #
    # @see https://docs.phantom.org/v1.0/reference
    class ConnectionManager
      attr_accessor :default, :connections

      # Create a new client instance.
      #
      # @return [Faraday::Response]
      def initialize
        @default = 'main'
        @connections = {}
      end

      # Connection to the given connection.
      #
      # @param connection [PhantomChain::Client::Connection]
      # @param name [String]
      #
      # @return [Faraday::Response]
      def connect(connection, name = 'main')
        @connections[name] = connection
      end

      # Disconnect from the given connection.
      #
      # @param name [String]
      #
      # @return [nil]
      def disconnect(name)
        @connections.delete(name)
      end

      # Get a connection instance.
      #
      # @param name [String]
      #
      # @return [PhantomChain::Client::Connection]
      def connection(name)
        @connections[name]
      end
    end
  end
end
