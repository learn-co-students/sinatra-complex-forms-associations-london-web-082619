class PetsController < ApplicationController

  #READ - index
  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  #CREATE - new
  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  #CREATE - create
  post '/pets' do 
    @pet = Pet.create(params[:pet])

    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end

    @pet.save

    redirect to "pets/#{@pet.id}"
  end

  #UPDATE - edit
  get '/pets/:id/edit' do
       @pet = Pet.find(params[:id])
       @owners = Owner.all
    erb :'/pets/edit'
  end

  #UPDATE - show
  get '/pets/:id/?' do 
    @pet = Pet.find(params[:id])
    @owner = Owner.find(@pet.owner_id)
    erb :'/pets/show'
  end


  #UPDATE - update
  patch '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.update(params[:pet])

    #binding.pry

    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end

    @pet.save

    redirect to "pets/#{@pet.id}"
  end
end

