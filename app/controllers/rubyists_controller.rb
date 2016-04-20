class RubyistsController < ApplicationController

  def index
    query = "location:Indianapolis language:Ruby"
    options = { per_page:9999, order:"asc", sort:"joined" }
    lrs = Octokit.search_users(query, options)
    @locosrubios = lrs.items
  end
end
