class Api::V1::ProjectsController < Api::V1::ApiController
  before_action :set_project, only: %i[show update destroy]

  # GET /projects
  def index
    projects = policy_scope(Project)

    if params[:featured].present?
      projects = projects.where(featured: ActiveModel::Type::Boolean.new.cast(params[:featured]))
    end

    render json: projects
  end

  # GET /projects/1
  def show
    authorize @project
    render json: @project
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    authorize @project

    if @project.save
      render json: @project, status: :created, location: api_v1_project_url(@project)
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_content
    end
  end

  # PATCH/PUT /projects/1
  def update
    authorize @project

    if @project.update(project_params)
      render json: @project
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_content
    end
  end

  # DELETE /projects/1
  def destroy
    authorize @project

    if @project.destroy
      head :no_content
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_content
    end
  end

  # GET /projects/count
  def count
    authorize Project

    total_projects = Project.where(active: true).count
    render json: { total_projects: total_projects }
  end

  private

  def set_project
    @project = Project.find(params.expect(:id))
  end

  def project_params
    params.expect(
      project: [
        :name,
        :description,
        :details,
        :featured,
        :active,
        :extension_core_id
      ]
    )
  end
end
