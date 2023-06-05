class PagesController < ApplicationController
  def home
    @projects = Project.all.sort_by(&:id)
  end

  def about
  end
end
