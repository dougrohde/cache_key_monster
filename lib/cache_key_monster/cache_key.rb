module CacheKeyMonster
  module CacheKey

    module ClassMethods
      attr_reader :cache_key_monster_definition

      def cache_key(definition = Proc.new {|obj| obj.hash})
        @cache_key_monster_definition = definition
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    def cache_key
      "#{prefix}-#{cache_key_body}"
    end

    def cache_key_body
      self.class.cache_key_monster_definition ? self.class.cache_key_monster_definition.call(self) : self.hash
    end
    
    def prefix
      self.class.name.downcase
    end
  end
end