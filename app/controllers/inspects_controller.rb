class InspectsController < ApplicationController
  def schedule
  end

  def schedule_form
    @inspect = Inspect.new
    @times = {
      "08:00" => "08:00 AM",
      "08:30" => "08:30 AM",
      "09:00" => "09:00 AM",
      "09:30" => "09:30 AM",
      "10:00" => "10:00 AM",
      "10:30" => "10:30 AM",
      "11:00" => "11:00 AM",
      "11:30" => "11:30 AM",
      "12:00" => "12:00 PM",
      "12:30" => "12:30 PM",
      "13:00" => "01:00 PM",
      "13:30" => "01:30 PM",
      "14:00" => "02:00 PM",
      "14:30" => "02:30 PM",
      "15:00" => "03:00 PM",
      "15:30" => "03:30 PM",
      "16:00" => "04:00 PM",
      "16:30" => "04:30 PM",
      "17:00" => "05:00 PM",
      "17:30" => "05:30 PM",
      "18:00" => "06:00 PM"
    }
    @pre_filled_email = params[:email] || ""  # Captura el email de la URL
  end

  def create
    @inspect = Inspect.new(inspect_params)
    if @inspect.save
      flash[:notice] = 'La inspección se ha creado con éxito.' # Mensaje de éxito
      redirect_to root_path
    else
      render :schedule_form
    end
  end

  def show
    @inspect = Inspect.find_by(hash_finder: params[:hash_finder])
  end

  private

  # Define the inspect_params method
  def inspect_params
    params.require(:inspect).permit(:kind_id, :body, :email, :revision_date, :revision_time, :phone)
  end
end

