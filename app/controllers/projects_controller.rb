class ProjectsController < ApplicationController

  def home
    @projects = Project.all
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end
end
