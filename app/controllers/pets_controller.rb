class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    if !params["pet"]["owner_name"].empty?
      @owner = Owner.create(name: params["pet"]["owner_name"])
      @pet = Pet.create(name: params[:pet][:name], owner_id: @owner.id)
    else
      @pet = Pet.create(name: params["pet"]["name"], owner_id: params["pet"]["owner_id"])
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/show'
  end

  patch '/pets/:id' do
    @pet =  Pet.find(params[:id])
    
    if !params["pet"]["owner_name"].empty?
      @owner = Owner.create(name: params["pet"]["owner_name"])
      @pet.update(name: params["pet"]["name"], owner_id: @owner.id)
    else
      @pet.update(name: params["pet"]["name"], owner_id: params["pet"]["owner_id"])
    end

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end
    



end