class RubyistsController < ApplicationController

  def index
    query = "location:Indianapolis language:Ruby"
    options = { per_page:9999, order:"asc", sort:"joined" }
    lrs = Octokit.search_users(query, options).items
    @locosrubios = map_gh_info(lrs)
  end

  private

  def map_gh_info(users)
    users.collect do |lr|
      user = Octokit.user lr.username
      lr.created_at   = human_time(user.created_at)
      lr.public_repos = user.public_repos
      lr.location     = user.location
      lr.followers    = user.followers
      lr.following    = user.following
    end
    users
  end
end
