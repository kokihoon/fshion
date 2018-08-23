class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
#    @note = Note.all
    @note = Note.order(created_at: :DESC) #최근에 쓴 글이 위로
  end

  def show
  end
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    # @note.title = params[:note][:title]
    # @note.content = params[:note][:content]
    # @note.user_id = params[:note][:user_id]
    @note.save

    #redirect_to note_path(@note)
    redirect_to @note
  end

  def edit
  end

  def update
    # @note = Note.new
    # @note.title = params[:note][:title]
    # @note.content = params[:note][:content]
    # @note.user_id = params[:note][:user_id]
    # @note.save
    @note.update(note_params)


    #redirect_to note_path(@note)
    redirect_to @note
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private
  def set_note
    @note =  Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:user_id, :title, :content)

  end
end
