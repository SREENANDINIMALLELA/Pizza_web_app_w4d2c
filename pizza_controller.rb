require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')
also_reload('./models/*')
#get all orders
get '/pizza_orders'do
@orders = PizzaOrder.all()
erb (:index)
end

# new order
get '/pizza_orders/new' do
  erb(:new)
end

get '/pizza_orders/:id/edit'do
@order= PizzaOrder.find(params[:id])
erb(:edit)
end

#create order
post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end
# show orders with # ID

get '/pizza_orders/:id' do
  @order= PizzaOrder.find(params[:id])
  erb(:show)
end




post '/pizza_orders/:id/edit' do
    @order = PizzaOrder.find(params[:id])
    @order.update
erb(:update)
end

post '/pizza_orders/:id/delete' do
  @order= PizzaOrder.find(params[:id])
  # @order.delete()
  erb(:delete)
redirect to '/pizza_orders'
end



# new pizza_orders

# get '/pizza_orders/new'do
# erb (:new)
# end
