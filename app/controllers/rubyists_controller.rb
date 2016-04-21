class RubyistsController < ApplicationController

  def index
    query = "location:Indianapolis language:Ruby"
    options = { per_page:9999, order:"asc", sort:"joined" }
    lrs = Octokit.search_users(query, options).items
    @locosrubios = map_gh_info(lrs)
  end

  def human_time(time)
    time.to_date.to_s.humanize.slice(2,9)
  end

  def one_word(str)
    str.split(' ').first
  end

  private

  def map_gh_info(users)
    users.map do |lr|
      Octokit.user lr.login
    end
  end
end
