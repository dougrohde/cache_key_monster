require 'cache_key_monster'

class NoKeyProvided
  
  include CacheKeyMonster::CacheKey

  cache_key
  
end