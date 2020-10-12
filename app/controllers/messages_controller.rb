class MessagesController < ApplicationController
  before_action :set_todo_list
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET todo_lists/1/messages
  def index
    @messages = @todo_list.messages
  end

  # GET todo_lists/1/messages/1
  def show
  end

  # GET todo_lists/1/messages/new
  def new
    @message = @todo_list.messages.build
  end

  # GET todo_lists/1/messages/1/edit
  def edit
  end

  # POST todo_lists/1/messages
  def create
    @message = @todo_list.messages.build(message_params)

    if @message.save
      redirect_to([@message.todo_list])
    else
      render action: 'new'
    end
  end

  # PUT todo_lists/1/messages/1
  def update
    if @message.update_attributes(message_params)
      redirect_to([@message.todo_list, @message], notice: 'Message was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE todo_lists/1/messages/1
  def destroy
    @message.destroy

    redirect_to todo_list_messages_url(@todo_list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def set_message
      @message = @todo_list.messages.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:is_read, :todo_list_id, :body)
    end
end
