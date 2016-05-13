require 'httparty'

class Recipe

  include HTTParty
  # TODO How does 'key_value'relate to the rest of the code?
  key_value = ENV["FOOD2FORK_KEY"]
  # 'FOOD2FORK_SERVER_AND_PORT' is used by the grader and 
  # needs not be defined. 
  hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] || "www.food2fork.com" 
  base_uri "http://#{hostport}/api"
  # base_uri "http://food2fork.com/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end

# http://food2fork.com/api/search?key=2c73eabf0e5d3d8d3dc2b65bea9bf79f&q=chocolate