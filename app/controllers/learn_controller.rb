class LearnController < ApplicationController
  def index
    @levels = Level.all
  end
end
