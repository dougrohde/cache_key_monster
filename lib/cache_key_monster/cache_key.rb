require "cache_key_monster/strategy"

module CacheKeyMonster
  module CacheKey

    module ClassMethods
      attr_reader :cache_key_monster_strategies

      def cache_key(options={})
        @cache_key_monster_strategies ||= []
        strategy = Strategy.new(options[:key], options[:duration], options[:condition])
        @cache_key_monster_strategies << strategy
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    def cache_key
      self.class.cache_key_monster_strategies.each do |strategy|
        if strategy.condition_applies?(self)
          return "#{prefix}-#{cache_key_body(strategy)}"
        end
      end
      "#{prefix}-#{default_cache_key_monster_key}"
    end

    def cache_key_body(strategy)
      strategy.execute_key_definition(self)
    end
    
    def prefix
      self.class.name.downcase
    end
    
    def default_cache_key_monster_key
      self.hash
    end
  end
end