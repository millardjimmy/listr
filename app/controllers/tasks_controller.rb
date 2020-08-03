
class TasksController < ApplicationController
    before_action :set_category
    before_action :set_list
    before_action :find_task, only: [:edit, :update, :destroy]
  
    def new
      @task = Task.new
    end
  
    def create
      @task = @list.tasks.build(task_params)
  
      # tag_id would not get assigned without this line
      @task.tag_id = params[:tag_id]
      if @task.save
        redirect_to user_category_list_path(current_user, @category, @list)
      else
        flash[:errors] = @task.errors.full_messages
        render :new
      end
    end
  
    def edit
    end
  
    def update
      @task.list_id = params[:new_list_id]
      @task.tag_id = params[:new_tag_id]
      if @task.update(task_params)
        redirect_to user_category_list_path(current_user, @category, @list)
      else
        flash[:errors] = @task.errors.full_messages
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to user_category_list_path(current_user, @category, @list)
    end
  
    private
  
    def find_task
      @task = Task.find_by(id: params[:id])
    end
  
    def task_params
      params.require(:task).permit(:user_id, :task_desc, :list_id, :task_priority, :category_id, :tag_id)
    end
  end