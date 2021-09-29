class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.create(board_params)
    board.save
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
