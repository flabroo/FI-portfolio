class ProjectsController < ApplicationController
  require 'open-uri'

  def show
    @project = Project.find(params[:id])
    @images_path = Dir.glob("app/assets/images/#{@project.pic_folder}/*").map { |path| "#{@project.pic_folder}/#{File.basename(path)}" }
  end

  def bot_message
    @checker = params[:name].present? || params[:email].present? || params[:message].present?

    if @checker
      message = "Hello! You have a new inquiry.%0A*Name*: #{params[:name]}%0A*Email*: #{params[:email]}%0A*Message*: #{params[:message]}"

      URI.open("https://api.telegram.org/bot#{ENV['TELEGRAM_BOT_API']}/sendMessage?chat_id=#{ENV['TELEGRAM_CHAT_ID']}&parse_mode=Markdown&text=#{message}")
    end

    respond_to do |f|
      f.html
      f.json
    end
  end
end
