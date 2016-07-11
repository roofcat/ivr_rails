class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def dashboard
    #raise params[]
    if params[:date_from] || params[:date_to]
      @calls = Call.paginate(page: params[:page], per_page: 50).por_fechas(params[:date_from], params[:date_to])
    else
      @calls = Call.paginate(page: params[:page], per_page: 50).ultimos
    end
  end

end
