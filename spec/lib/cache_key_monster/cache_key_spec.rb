require 'spec_helper'

describe CacheKeyMonster::CacheKey do

  context "a list of batting leaders" do

    before(:each) do
      @players = Player.new(14, "Andres", 0.371), Player.new(19, "Tony", 0.358), Player.new(25, "Gregg", 0.342)
      @leaders = BattingLeaders.new(@players)
    end

    it "should respond to cache_key method" do
      @leaders.should respond_to(:cache_key)
    end

    it "should create a cache key from constituent data" do
      @leaders.cache_key.should eq("battingleaders-1419250.3710.3580.342")
    end

    it "should return the hash of the object if no definition provided" do
      no_key = NoKeyProvided.new
      no_key.cache_key.should eq("nokeyprovided-#{no_key.hash.to_s}")
    end
  end

end

