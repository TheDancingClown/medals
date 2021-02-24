module Api
  module V1
    class RacesController < ApplicationController
      before_action :find_race, only: %i[show update destroy]

      def index
        races = Race.all

        render json: RaceSerializer.new(races).serialized_json
      end

      def show
        if @race
          render json: RaceSerializer.new(@race, options).serialized_json
        else 
          not_found
        end
      end

      def create
        race = Race.new(race_params)
        
        if race.save
          render json: RaceSerializer.new(race).serialized_json
        else
          render json: { error: race.errors.messages }, status: 422
        end
      end

      def update
        if @race.update(race_params)
          render json: RaceSerializer.new(@race, options).serialized_json
        else
          render json: { error: @race.errors.messages }, status: 422
        end
      end

      def destroy
        if @race.destroy
          head :no_content
        else 
          render json: { error: @race.errors.messages }, status: 422
        end
      end

      private

      def race_params
        params.require(:race).permit(:name, :date)
      end

      def find_race
        @race = Race.find_by(slug: params[:slug])
      end

      def options
        @options ||= { include: %i[orders] }
      end

      def not_found
        render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
      end
    end
  end
end