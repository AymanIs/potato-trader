class BestDailyPotentialGainController < ApplicationController
    MAX_TONS = 100  # here's buying limits
  
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
  
      # Get the dates for this date 
      prices = PotatoPrice.for_date(date)
  
      if prices.empty?
        render json: { error: "Aucun prix trouvé pour cette date", date: date_param }, status: :not_found
        return
      end
  
      max_gain = calculate_max_gain_for_day(prices)
  
      result = {
        date: date_param,
        max_gain: format('%.2f', max_gain),
        currency: "EUR",
        max_tons: MAX_TONS
      }
  
      render json: result
    end
  
    private
  
    def calculate_max_gain_for_day(prices)
      return calculate_max_gain(prices)
    end
  
   
   
    def calculate_max_gain(prices)
      return 0.0 if prices.empty?
  
      max_gain = 0.0
      min_price = prices.first.price
  
      prices.each do |current_price|
        gain = MAX_TONS * (current_price.price - min_price)
        max_gain = gain if gain > max_gain
  
        min_price = current_price.price if current_price.price < min_price
      end
  
      max_gain
    end
  end