class PairingsController < ApplicationController
  before_action :set_user
  def index
    @available_pairings =  Pairing.available_pairings(current_user)
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
    @pairing = Pairing.find(params[:id])
  end

  def update
    @pairing = Pairing.find(params[:id])
    @pairing.update_attributes(student_id: current_user.id)
    if @pairing.save
      redirect_to pairings_path
    else
      render 'edit'
    end
  end

  def destroy
    @pairing = Pairing.find(params[:id])
    @pairing.destroy
    redirect_to(:back)
  end

  private

  def pairing_params
    params.require(:pairing).permit(:mentor_id, :student_id, :start_time_text)
  end

end
