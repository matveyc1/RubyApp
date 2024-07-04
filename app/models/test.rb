require 'json'
require 'net/http'

class Dellivary
   @price = 0
  def initialize(width, length, height, weight, place_A, place_B)
   @we = weight.to_i
   @w = width
   @l = length
   @h = height
   n = 1000000
   @v = (@w.to_i * @l.to_i * @h.to_i) / n.to_i
   @start = place_A.to_s
   @finish = place_B.to_s
   if @v < (1).to_i 
      @price = (1).to_i
   elsif @v > (1).to_i && @we <= (10).to_i 
      @price = (2).to_i
   else 
      @price = (3).to_i
   end
  end
   def put
   response=Net::HTTP.get_response(URI("https://api.distancematrix.ai/maps/api/distancematrix/json?origins="+ @start + "&destinations="+ @finish +"&key=HRVvmjjCm1YkmdT5AsLQqbAW8I7wFfnYGmPyyUzwWIsScmUeCLpetF3sDou8FJGb"))
   parsed_data = JSON.parse(response.body)
   v1 = parsed_data["rows"]        #беру значения из "rows"
   v2 = v1[0]                      #при присваивании v2 станивится hash
   v3 = v2["elements"]             #беру значения из "elements"
   v4 = v3[0]                      #при присваивании v4 станивится hash
   v5 = v4["distance"]             #беру значения из "distance"
   distanse = v5["text"]           #беру значение из "text"
   @dist = (v5["value"]).to_i          #беру значение из "value"
   @optins = distanse.to_s
   end

   def red
      @price = (@dist / (100).to_i) * @price 
   end
end