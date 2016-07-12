class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def dashboard
    #raise params[]
    if params[:format]
      if params[:date_from] || params[:date_to]
        @calls = Call.por_fechas(params[:date_from], params[:date_to])
      else
        @calls = Call.ultimos
      end
    else
      if params[:date_from] || params[:date_to]
        @calls = Call.paginate(page: params[:page], per_page: 50)
                     .por_fechas(params[:date_from], params[:date_to])
      else
        @calls = Call.paginate(page: params[:page], per_page: 50).ultimos
      end
    end

    respond_to do |format|
      format.html
      format.csv { render text: @calls.to_csv }
      format.xls
    end
  end

end
