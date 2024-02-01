class LearnController < ApplicationController
  def index
    @levels = Level.reorder(code: -1).all
  end
end
