class AlertsController < ApplicationController

  def index
    if params[:page_no].present? && params[:status].present?
      alerts = @current_user.alerts.where(status: params[:status]).page(params[:page_no]).per(5)
    elsif params[:status].present? && params[:page_no].blank?
      alerts = @current_user.alerts.where(status: params[:status])
    elsif params[:page_no].present? && params[:status].blank?
      alerts = @current_user.alerts.page(params[:page_no]).per(5)
    else
      alerts = @current_user.alerts
    end
    return render json: alerts
  end

  def create
    user = @current_user.alerts.create(alert_params)
    render json: user
  end

  def delete
    return render json: {message: 'Please provide alert id'} if params[:alert_id].blank?
    alert = @current_user.alerts.find_by(id: params[:alert_id])
    return render json: {message: 'Alert Not Found!'} if alert.blank?
    alert.update(status: 'deleted')
    render json: {data: alert, message: 'Alert deleted successfully!'}
  end


  private
  def alert_params
    params.permit(:price, :status, :user)
  end
end
