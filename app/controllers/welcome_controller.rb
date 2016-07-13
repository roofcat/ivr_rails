class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def dashboard
    #raise params[]
    if params[:date_from] || params[:date_to]
      @date_from = params[:date_from]
      @date_to = params[:date_to]
      @calls = Call.paginate(page: params[:page], per_page: 50)
                   .por_fechas(params[:date_from], params[:date_to])
    else
      @calls = Call.paginate(page: params[:page], per_page: 50).ultimos
    end

  end

  def export

    if params[:date_from] || params[:date_to]
      @calls = Call.por_fechas(params[:date_from], params[:date_to])
    else
      @calls = Call.ultimos
    end

    respond_to do |format|
      format.csv { render text: @calls.to_csv  }
      format.xls
    end

  end

end
