class Api::CommunicationsController < ApplicationController

  def create
    @communication = Communication.new(communication_params)
    if @communication.save
      render :index, status: :created
    else
      render_error
    end
  end

  def index
    if params[:practitioner_id].blank?
      @communications = Communication.includes(:practitioner)
    else
      @communications = Communication.where(practitioner_id: params[:practitioner_id])
    end
    @communications = @communications.paginate(page: params[:page], per_page: 100)
  end

  private

  def render_error
    render json: { errors: @communication.errors.full_messages },
      status: :unprocessable_entity
  end

  def communication_params
    params.require(:communication).permit(:practitioner_id, :sent_at)
  end

end
