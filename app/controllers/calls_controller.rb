class CallsController < ApplicationController

  protect_from_forgery with: :null_session
  before_action :set_call, except: [:index, :new, :create]

  def index
    @calls = Call.all
  end

  def show
  end

  def new
    @call = Call.new
  end

  def create
    @call = Call.new(call_params)

    respond_to do |format|

      if @call.save
        format.html { redirect_to @call, notice: "Llamada creada exitosamente." }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new }
        format.html { render json: @call.errors, status: :unprocessable_entity }
      end

    end

  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

    def set_call
      @call = Call.find(params[:id])
    end

    def call_params
      params.require(:call).permit(
            :collection, :sp, :key, :beginCall, :origin, :callAnswered,
            :lastState, :IVRSel, :dialIntentBegin1, :dialIntentCaller1,
            :dialIntentCalled1, :dialIntentEnd1, :dialIntentAnswered1,
            :sessionFile, :hc, :routing, :name, :endDial, :timeStamp
      )
    end

end
