module SimRoutes
  class Builder
    attr_reader :routes
    
    def initialize(block)
      @routes = SimRoutes::Routes::RouteSet.new
      instance_eval &block
    end

    protected

    def resources(*args)
      route_name = args.first.to_s
      define(route_name, :method => :get, :action => :index) #Index
      define(route_name, :method => :get, :action => :new) #New
      define("#{route_name}/:id", :method => :get, :action => :new) #New
      #TODO: Add other REST methods
    end

    def define(*args)
      route_path = args.first
      options = args.extract_options!
      route = SimRoutes::Routes::Route.new(route_path, options)
      @routes.add_route(route)
    end

    class << self
      def build(&block)
        builder = new(block)
        builder.routes
      end
    end
  end
end
