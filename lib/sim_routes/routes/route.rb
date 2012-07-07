module SimRoutes
  class Routes::Route
    attr_reader :path, :options

    def initialize(path, args = {})
      @path = path
      @options =  default_params.merge(args)
    end

    def match(match_path)
      pattern = @path.dup
      @options.keys.each do |key|
        pattern.gsub!(key.to_s, @options[key].to_s)
      end
      regex_p = Regexp.new(pattern)
      regex_p.match(match_path)
    end

    protected

    def default_params
      {
        :id => /[\w-]+/
      }
    end

  end
end
