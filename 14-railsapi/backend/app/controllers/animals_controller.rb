class AnimalsController < ApplicationController
  def index
    animals = Animal.all

    render json: animals
  end



  def create
    species = Species.find_or_create_by(name: params[:species])

    animal = Animal.create(name: params[:name], gender: params[:gender].to_i, species: species)

    render json: animal

  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy


    render json: { message: 'success'}


  end

end
