class Rating < ActiveRecord::Base
  COLOR = ["Red", "Green", "Yellow"]

  belongs_to :user
  belongs_to :subject

  def self.for_subject_and_user(subject, current_user)
    Rating.where(subject_id: subject.id, user_id: current_user.id)
  end
end
