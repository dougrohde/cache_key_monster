module CacheKeyMonster
  class Strategy
    
    attr_reader :key_definition, :condition
    
    def initialize(key_definition, duration, condition)
      @key_definition = key_definition
      @duration = duration || 0
      @condition = condition || Proc.new{|obj| true}
    end
    
    def condition_applies?(obj)
      return true if condition.nil?
      condition.call(obj)
    end
    
    def execute_key_definition(obj)
      key_definition ? key_definition.call(obj) : obj.default_cache_key_monster_key
    end
    
  end
end