module SimRoutes
  module Routes
    class RouteSet
      attr_accessor :routes
      
      def initialize
        @routes = []
      end

      def add_route(route)
        @routes << route
      end

      def match(path)
        @routes.each do |route|
          return true if route.match(path)
        end
        false
      end

    end
  end
end
