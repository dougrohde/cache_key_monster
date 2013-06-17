require 'cache_key_monster'

class LiveEvent

  include CacheKeyMonster::CacheKey

  cache_key key: ->(obj){obj.title}, condition: ->(obj){obj.status == "pending"}
  cache_key key: ->(obj){obj.id}, condition: ->(obj){obj.status == "completed"}
  
  attr_accessor :status
  attr_reader :id, :title
  
  def initialize(params={})
    @id = params[:id]
    @title = params[:title]
  end
  
end