# OM! NOM! NOM!

ME CACHE KEY MONSTER. ME LOVE TO MAKE CACHE KEYS EASY!

![The loveable, furry, non-infringing cache key monster](https://github.com/dougrohde/cache_key_monster/raw/master/cache_key_monster.jpg "The loveable, furry, non-infringing cache key monster")

## CacheKeyMonster

CacheKeyMonster provides a lightweight, declarative-style syntax for adding the cache_key method which is used by Rails' "cache" method.  It allows you to cache Plain Old Ruby objects based on their constituent data.  This is useful for objects that are transient by their very nature.


## Usage

CacheKeyMonster is designed for caching things that are transient by their nature. In the case where HTML fragment 
caching might not be a reasonable option, this provides an alternative.

For example, say you have a resource that displays an up-to-date, ordered list of baseball statistics.  In this case, the resource isn't a represented by a single object. Instead,
it's the individual player statistics that make up the resource.

In the example below, BattingLeaders accepts an array of player statistics. 

The cache_key declaration accepts a lambda for its key option.  Here, when cache_key gets called on an instance of BattingLeaders,
it will resolve to a concatenated string composed of each individual stat record's id and avg fields, in order.  If any
of the players' averages changes, or the order changes, the resource will generate a new cache key.
Of course this does require a request to the database each time, but generally this is cheaper than rendering.

```
class BattingLeaders
  
  include CacheKeyMonster::CacheKey
  
  cache_key key: ->(obj){obj.leaders.map(&:id).join + obj.leaders.map(&:avg).join}

  attr_accessor :leaders

  def initialize(leaders)
    @leaders = leaders
  end
  
  
end
```


## Installation

Add this line to your application's Gemfile:

    gem 'cache_key_monster'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cache_key_monster
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
