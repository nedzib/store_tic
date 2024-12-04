class AdminController < ApplicationController
  before_action :authenticate_user!
  STATUS_ORDER = %w[requested received in_progress waiting_for_client finished].freeze

  def dashboard
    @pending_inspects_count = Inspect.where(status: 0).count
    @finished_inspects_count = Inspect.where(status: 4)
                                      .where('extract(month from end_date) = ?', Time.current.month)
                                      .count
  end

  def table
    @inspects_by_status = Inspect.all.group_by(&:status)
  end

  def receipt
    @inspect = Inspect.find(params[:id])
    render layout: false
  end

  def kind
  end

  def create_kind
  end

  def edit_kind
  end

  def update_kind
  end

  def change_status
    @inspect = Inspect.find(params[:id])
    current_status_index = STATUS_ORDER.index(@inspect.status)

    if params[:status] == 'next'
      new_status_index = (current_status_index + 1) % STATUS_ORDER.size
    elsif params[:status] == 'previous'
      new_status_index = (current_status_index - 1 + STATUS_ORDER.size) % STATUS_ORDER.size
    else
      flash[:alert] = "Acción no válida"
      redirect_to admin_table_path and return
    end

    new_status = STATUS_ORDER[new_status_index]

    unless @inspect.update(status: new_status)
      flash[:alert] = "Error al actualizar el estado"
    end

    redirect_to admin_table_path
  end
end
