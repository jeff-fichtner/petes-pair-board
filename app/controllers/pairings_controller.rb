class PairingsController < ApplicationController

  def index
    @pairings = Pairing.order(start_time: :desc).limit(10)
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
    params.require(:pairing).permit(:start_time, :mentor_id, :student_id)
  end

end
