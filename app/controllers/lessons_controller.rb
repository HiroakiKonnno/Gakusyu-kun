class LessonsController < ApplicationController
  def show
  end

  def new
    @lesson = Lesson.new
    @task = @lesson.tasks.build
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.save!
    redirect_to lessons_url
  end

  def index
    @lessons = Lesson.all
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:success] = "#{@lesson.lesson_name}のデータを削除しました。"
    redirect_to lessons_url
  end

  def destroy_task
    @task = Task.find(params[:id])
    @lesson_page = Lesson.find_by(@task.lesson_id)
    @task.destroy
    flash[:success] = "#{@task.task_name}のデータを削除しました。"
    redirect_to edit_lesson_path(@lesson_page)
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:success] = "学習コース情報を更新しました。"
    else
      flash[:danger] = "学習コース情報を更新できませんでした。"
    end
    redirect_to lessons_url
  end

  private

  def lesson_params
    params.require(:lesson).permit(:id, :lesson_name, tasks_attributes: [:lesson_id, :task_name, :_destroy])
  end

end
