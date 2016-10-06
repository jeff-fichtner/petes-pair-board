class PairingsController < ApplicationController
  def index
    @upcoming_pairings = Pairing.order(start_time: :desc).limit(10)
    @previous_pairings = Pairing.where({mentor_id: current_user.id}).order(:start_time).limit(10)
  end

  def new
    @pairing = Pairing.new
  end

  def create
    @pairing = Pairing.new(pairing_params.merge(mentor_id: current_user.id))
    if @pairing.save
      redirect_to pairings_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def pairing_params
    params.require(:pairing).permit(:mentor_id, :student_id, :start_time_text)
  end

end
