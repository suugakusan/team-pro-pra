class TextsController < ApplicationController
  def index
    @texts = Text.where(genre: Text::RAILS_GENRE_LIST)
    @texts = Text.genre_list(params[:genre])
  end

  def show; end
end
