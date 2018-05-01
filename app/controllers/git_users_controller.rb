class GitUsersController < ApplicationController
  def new
    @git_user = GitUser.new
  end

  def create
    @git_user = GitUser.new(git_user_params)
    # @git_user.response = get_user_repos(git_user_params[:username])
    @git_user.favourite = count_language_prefs(get_user_repos(git_user_params[:username]))

    if @git_user.save
      redirect_to git_user_path(@git_user)
    else
      render :new
    end
  end

  def show
    @git_user = GitUser.find(params[:id])
  end

  private
  def git_user_params
    params.require(:git_user).permit(:username)
  end

  def get_user_repos(user_id)
    uri = URI("https://api.github.com/users/#{user_id}/repos")
    req = Net::HTTP::Get.new(uri)

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) {|http|
      http.request(req)
    }
    JSON.parse(res.body)
  end

  def count_language_prefs(json_response)
    language_count = {}
    json_response.each do |repo|
      # puts repo["name"]
      # puts repo["language"]
      language_count[repo["language"]] ? language_count[repo["language"]] += 1 : language_count[repo["language"]] = 1
    end
    puts language_count
    return language_count.key(language_count.values.max)
  end

end
