class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "投稿完了しました"
      redirect_to tasks_path
    else
      flash[:error] = "投稿失敗"
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
      if @task.update(params[:task])
        flash[:success] = "It's successfully updated"
        redirect_to tasks_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = 'Its successfully deleted.'
      redirect_to tasks_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to tasks_path
    end
  end
  
  
  

  private

  def task_params
    params.require(:task).permit(:title)
  end
  
  
end