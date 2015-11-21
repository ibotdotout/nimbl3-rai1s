class Job < ActiveRecord::Base
  belongs_to :user

  def as_json(options={})
    super(:methods => [:id, :lenght, :data], except: [:created_at, :updated_at, :user_id])
  end
end
