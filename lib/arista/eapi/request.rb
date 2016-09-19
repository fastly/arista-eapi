module Arista
  module EAPI
    class Request
      attr_accessor :switch, :commands, :options

      def initialize(switch, commands, options = {})
        options[:format] ||= 'json'

        self.switch = switch
        self.commands = commands
        self.options = options
      end

      def payload
        @payload ||= JSON.generate(
          jsonrpc: '2.0',
          method: 'runCmds',
          id: 1,
          params: {
            version: 1,
            cmds: commands,
            format: options[:format]
          }
        )
      end

      def execute
        req = RestClient::Request.execute(
          method: :get,
          url: switch.url,
          timeout: 10,
          verify_ssl: switch.verify_ssl,
          payload: payload
        )
        Arista::EAPI::Response.new(commands, req)
      end
    end
  end
end
