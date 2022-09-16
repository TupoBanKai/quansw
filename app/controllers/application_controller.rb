class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  # rescue_from CustomErrors::AccessForbidden, with: :render_forbidden

  private

  def render_success_ok
    200
  end

  # def render_forbidden(e)
  #   Raven.capture_exception(e)
  #   render json: { errors: [{ title: 'forbidden', code: '403', status: '403' }] },
  #          status: :forbidden
  # end

  def render_not_found(e)
    Raven.capture_exception(e)
    render json: { errors: [{ title: 'resource not found', code: '404', status: '404' }] }, status: :not_found
  end
end