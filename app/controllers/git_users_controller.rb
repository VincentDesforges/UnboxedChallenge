class GitUsersController < ApplicationController
  def new
    @git_user = GitUser.new
  end
end
