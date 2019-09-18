class OwnersController < ApplicationController

  #READ - index
  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index' 
  end

  #CREATE - new
  get '/owners/new' do 
    @pets = Pet.all
    erb :'/owners/new'
  end

  #CREATE - create
  post '/owners' do 
    @owner = Owner.create(params[:owner])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect "/owners/#{@owner.id}"
  end

  #UPDATE - edit
  get '/owners/:id/edit' do   
    @owner = Owner.find(params[:id])
    @pets = Pet.all
    erb :'/owners/edit'
  end

  #READ - show
  get '/owners/:id' do 
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  #UPDATE - update
  patch '/owners/:id' do 
    @owner = Owner.find(params[:id])
    @owner.update(params[:owner])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect "owners/#{@owner.id}"
  end

end