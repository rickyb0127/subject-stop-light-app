class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end
