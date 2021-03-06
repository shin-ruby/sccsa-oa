class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result.includes(:category).paginate(:page => params[:page], :per_page => 30)
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      respond_with(@project, location: ->{projects_path})
    else
      render action: 'new'
    end
  end

  def update
    if @project.update(project_params)
      respond_with(@project)
    else
      render action: 'edit'
    end
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :serial, :category_id, :description)
    end
end
