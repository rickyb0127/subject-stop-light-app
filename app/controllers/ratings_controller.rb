class RatingsController < ApplicationController
  before_action :set_subject

  def new
    @rating = @subject.ratings.new
  end

  def create
    @rating = @subject.ratings.new(rating_params.merge(user_id: current_user.id))
    if @rating.save
      redirect_to subjects_path
    else
      render :new
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      redirect_to subjects_path
    else
      render :edit
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to subjects_path
  end

  private

  def set_rating
    @rating = Rating.where(subject_id: @subject, user_id: @current_user)
  end

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end


  def rating_params
    params.require(:rating).permit(:comments, :color)
  end
end
