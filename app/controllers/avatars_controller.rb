class AvatarsController < ApplicationController
  def create
    Avatar.create!
    render action: :index
  end
end
