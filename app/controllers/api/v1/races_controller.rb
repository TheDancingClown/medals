module Api
  module V1
    class RacesController < ApplicationController
      def index
        races = Race.all

        render json: RaceSerializer.new(races, options).serialized_json
      end

      def show
        race = Race.find_by(slug: params[:slug])

        render json: RaceSerializer.new(race, options).serialized_json
      end

      private

      def options
        @options ||= { include: %i[orders] }
      end
    end
  end
end