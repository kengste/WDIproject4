class ClientsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  devise_group :person, contains: [:user, :staff]
  before_action :authenticate_person!

  def index
    @clients = []
    @clients = current_person.clients if current_person
  end

  def show
    @appointments = @client.appointments
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.valid?
      @client.user = current_user
      @client.save
      redirect_to appointments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @client.update(client_params)
    redirect_to client_path(@client)
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def set_client
    @client = current_person.clients.find_by(id: params[:id])
    if @client.nil?
      flash[:error] = "Client not found."
      redirect_to clients_path
    end
  end

  def client_params
    params.require(:client).permit(:name, :email, :phone_number)
  end

end
