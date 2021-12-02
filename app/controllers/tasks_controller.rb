class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]


  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
    render json: @tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:id])
    render json: { data: @task, status: :ok, message: 'Success' }
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        render json: {status: :ok, message: 'Success' }
      else
        render json: { json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        render json: { json: @task.to_json,status: :ok, message: 'Success' }
      else
        render json: { json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      render json: { json: 'Task was successfully deleted.'}
    else
      render json: { json: @task.errors, status: :unprocessable_entity }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:id,:create_time, :name, :status)
    end
end
