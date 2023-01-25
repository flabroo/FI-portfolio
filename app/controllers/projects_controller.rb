class ProjectsController < ApplicationController

  def home
    @projects = Project.all.sort { |project| project.id }
  end

  def about
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def download_cv
    send_file "#{Rails.root}/public/docs/Fairul-CV.pdf", type: "application/pdf", x_sendfile: true
  end
end
