require 'cache_key_monster'

class BattingLeaders

  include CacheKeyMonster::CacheKey

  cache_key key: ->(obj){obj.leaders.map(&:id).join + obj.leaders.map(&:avg).join}

  attr_accessor :leaders

  def initialize(leaders)
    @leaders = leaders
  end

end