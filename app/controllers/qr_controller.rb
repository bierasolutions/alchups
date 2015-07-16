class QrController < ApplicationController
  def show
    redirection = Redirection.find_by(id: params[:id])
    if redirection and redirection.target_url
      redirect_to redirection.target_url
    else
      render :text => 'qr without redirect'
    end
  end
end
