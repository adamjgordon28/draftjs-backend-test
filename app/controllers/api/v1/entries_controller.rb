class Api::V1::EntriesController < ApplicationController
    def index
      @entries= Entry.all
      render json: @entries
    end

    def show
      @entries = Entry.find(entry_params[:id])
      render json: @entries
    end

    def create
      @entries = Entry.find_or_create_by(entry_params)
      render json: @entries
    end

    def update
      @entries = Entry.find(entry_params[:id])
      @entries.update(entry_params)
      @entries.save
      render json: @entries
    end

    def destroy
      @entries = Entry.find(entry_params[:id])
      @entries.destroy
    end

    private

    def entry_params
      params.permit(:id, :content)
    end

  end
