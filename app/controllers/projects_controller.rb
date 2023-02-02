class ProjectsController < ApplicationController
  require 'open-uri'

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

  def bot_message
    @projects = Project.all.sort_by(&:id)
    message = "Hello! You have a new inquiry.%0A*Name*: #{params[:name]}%0A*Email*: #{params[:email]}%0A*Message*: #{params[:message]}"

    URI.open("https://api.telegram.org/bot#{ENV['TELEGRAM_BOT_API']}/sendMessage?chat_id=#{ENV['TELEGRAM_CHAT_ID']}&parse_mode=Markdown&text=#{message}")

    # flash.now[:notice] = "Message Submitted!"
    # render :home, status: :ok, locals: { projects: Project.all.sort_by(&:id) }

    redirect_to root_path(@projects, anchor: 'bottom-form'), data: { turbo: false }, notice: 'Thank you for the message!'
  end
end
