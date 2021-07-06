class PetsController < ApplicationController

  #CREATE

  get '/pets/new' do
    erb :'/pets/new'
  end

  post '/pets' do
    if !params[:owner][:name].empty?
      @owner = Owner.create(params[:owner])
      @pet = Pet.create(params[:pet])
      @pet.owner = @owner
      @pet.save
    else
      @pet = Pet.create(params[:pet])
    end
     
    redirect to "pets/#{@pet.id}"
  end

  #READ

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  #UPDATE

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])

    erb :'/pets/edit'
  end

  patch '/pets/:id' do
    @pet = Pet.find(params[:id])

    @pet.name = params[:pet][:name]
    if !params[:owner][:name].empty?
      @owner = Owner.create(params[:owner])
      @pet.owner = @owner
      @pet.save
    else
      @pet.update(params[:pet])
    end

    redirect to "pets/#{@pet.id}"
  end
end