module Api
  module V1
    class RunnersController < ApplicationController
      before_action :find_runner, only: %i[show update destroy] 

      def index
        runners = Runner.all

        render json: RunnerSerializer.new(runners).serialized_json
      end

      def show
        if @runner
          render json: RunnerSerializer.new(@runner).serialized_json
        else 
          not_found
        end
      end

      def create
        runner = Runner.new(runner_params)
        if runner.save
          render json: RunnerSerializer.new(@runner).serialized_json
        else
          render json: { error: runner.errors.messages }, status: 422
        end
      end

      def update
        if @runner.update(runner_params)
          render json: RunnerSerializer.new(@runner).serialized_json
        else
          render json: { error: @runner.errors.messages }, status: 422
        end
      end

      def destroy
        if @runner.destroy
          head :no_content
        else 
          render json: { error: @runner.errors.messages }, status: 422
        end
      end

      private

      def find_runner
        @runner = Runner.find_by_id(params[:id])
      end

      def runner_params
        params.require(:runner).permit(:name, :email, :address)
      end

      def not_found
        render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
      end
    end
  end
end