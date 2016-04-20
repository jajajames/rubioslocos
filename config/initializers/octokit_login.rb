Octokit.configure do |c|
  c.login = ENV['github_access_token']
  c.password = ENV['github_access_token']
end
