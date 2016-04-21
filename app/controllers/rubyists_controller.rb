class RubyistsController < ApplicationController

  def index
    query = "location:Indianapolis language:Ruby"
    options = { per_page:9999, order:"asc", sort:"joined" }
    lrs = Octokit.search_users(query, options).items
    @locosrubios = map_gh_info(lrs)
  end

  private

  def map_gh_info(users)
    users.map do |lr|
      Octokit.user lr.login
    end
  end
end
