module JettyRails
  module Adapters
    
    class RailsAdapter
      attr_reader :config
      
      def initialize(config)
        @config = config
      end
      
      def init_params
        # please refer to goldspike and jruby-rack documentation
        # in: PoolingRackApplicationFactory 
        @rails_params ||= {
          'rails.root' => '/',
          'public.root' => '/public',
          'rails.env' => config[:environment],
          'gem.path' => (ENV['GEM_PATH'] || 'tmp/war/WEB-INF/gems'),
          'jruby.initial.runtimes' => "#{config[:jruby_initial_runtimes]}",
          'jruby.max.runtimes' => "#{config[:jruby_max_runtimes]}"
        }
      end
      
      def rack_event_listener
        Rack::RailsServletContextListener.new
      end
      
    end
    
  end
end