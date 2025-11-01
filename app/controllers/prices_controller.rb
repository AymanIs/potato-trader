class PricesController < ApplicationController
    # GET /prices?date=2025-11-15
    def index
      date_param = params[:date]
      
      if date_param.blank?
        render json: { error: "Le paramètre 'date' est requis (format: YYYY-MM-DD)" }, status: :bad_request
        return
      end
  
      begin
        date = Date.parse(date_param)
      rescue ArgumentError
        render json: { error: "Format de date invalide. Utilisez le format: YYYY-MM-DD" }, status: :bad_request
        return
      end
  
      # get the prices for the date 
      prices = PotatoPrice.for_date(date)
  
      if prices.empty?
        render json: { error: "Aucun prix trouvé pour cette date", date: date_param }, status: :not_found
        return
      end
  
      # restart the data
      result = prices.map do |price|
        {
          time: price.recorded_at.iso8601(3),  
          value: format('%.2f', price.price)   
        }
      end
  
      render json: result
    end
  end