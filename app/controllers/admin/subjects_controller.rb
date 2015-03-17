class Admin::SubjectsController < ApplicationController
  before_action :ensure_admin

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to admin_subject_path(@subject)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @subject.update(subject_params)
      redirect_to subject_path
    else
      render :edit
    end
  end

  def show
    @subject = Subject.find(params[:id])
    @ratings = @subject.ratings.all
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to admin_subjects_path
  end

  private

  def is_admin
    unless current_user.admin == true
      flash[:notice] = "you must have admin rights"
    end
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end
