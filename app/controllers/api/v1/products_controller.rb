module Api
  module V1
    class ProductsController < ApplicationController

      def index
        products = Product.all

        #description
        if params[:description].present?
          products = Product.where(description: params[:description])
        else
          products
        end

        #category
        if params[:category].present?
          products = Product.where(category: params[:category])
        else
          products
        end

        #vegetarian
        if params[:vegetarian].present?
          products = Product.where(vegetarian: params[:vegetarian])
        else
          products
        end

        #price
        if params[:price].present?
          if params[:price] == 'true'
            products = products.order(price: :asc)
          else
            products =products.order(price: :desc)
          end
        else
          products
        end

        render json: {status: 'SUCCES', message: 'Loaded products', data: products}, status: :ok
      end

      def show
        product = Product.find(params[:id])
        render json: {status: 'SUCCES', message: 'Loaded product', data: product}, status: :ok
      end

      def create
        product = Product.new(product_params)

        if product.save
          render json: {status: 'SUCCES', message: 'Saved product', data: product}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Product not saved', data: product.errors},
          status: :unprocessable_entity
        end
      end

      def destroy
        product = Product.find(params[:id])
        product.destroy
        render json: {status: 'SUCCES', message: 'Deleted product', data: product}, status: :ok
      end

      def update
        product = Product.find(params[:id])
        if product.update_attributes(product_params)
          render json: {status: 'SUCCES', message: 'Updated product', data: product}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Product not updated', data: product.errors},
          status: :unprocessable_entity
        end
      end

      private

        def product_params
          params.permit(:name, :price, :description)
        end
    end
  end
end
