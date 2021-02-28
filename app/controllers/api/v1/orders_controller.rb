module Api
  module V1
    class OrdersController < ApplicationController
      def create
        order = Order.create(order_params)
        if order.save
          render json: OrderSerializer.new(order).serialized_json
        else
          render json: { error: order.errors.messages }, status: 422
        end
      end

      def destroy
        order = Order.find_by_id(params[:id])
        if order.destroy
          head :no_content
        else
          render json: { error: order.errors.messages }, status: 422
        end
      end

      private

      def order_params
        params.require(:order).permit(:runner_id, :race_id, :name, :date, :time)
      end
    end
  end
end