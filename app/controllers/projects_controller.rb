class ProjectsController < ApplicationController

  def home
    @projects = Project.all.sort_by(&:id)
  end

  def about
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @images_path = Dir.glob("app/assets/images/#{@project.pic_folder}/*").map { |path| "#{@project.pic_folder}/#{File.basename(path)}" }
  end

  def download_cv
    send_file "#{Rails.root}/public/docs/Fairul-CV.pdf", type: "application/pdf", x_sendfile: true
  end
end
