require "sinatra"

get '/' do
	redirect '/get_sandwich'
end

get '/get_sandwich' do
	erb :sandwich
end

post '/sandwich_choice' do
	sandwich = params[:sandwich].gsub(' ', '-')
	orderdate = params[:orderdate].gsub(' ', '-')
	redirect '/fries?sandwich=' + sandwich + '&orderdate=' + orderdate
end

get '/fries' do
	sandwich = params[:sandwich]
	orderdate = params[:orderdate]
	erb :fries, :locals => {:sandwich => sandwich, :orderdate => orderdate}
end

post '/fries_choice' do
	sandwich = params[:sandwich]
	fries = params[:fries].gsub(' ', '-')
	orderdate = params[:orderdate]
	if fries == "yes"
		side = "fries"
		redirect '/shake?sandwich=' + sandwich + '&side=' + side + '&orderdate=' + orderdate
	else
		erb :side, :locals => {:sandwich => sandwich, :orderdate => orderdate}
	end
end

post '/side_choice' do
	sandwich = params[:sandwich]
	side = params[:side].gsub(' ', '-')
	orderdate = params[:orderdate]
	redirect '/shake?sandwich=' + sandwich + '&side=' + side + '&orderdate=' + orderdate
end

get '/shake' do
	sandwich = params[:sandwich]
	side = params[:side]
	orderdate = params[:orderdate]
	erb :shake, :locals => {:sandwich => sandwich, :side => side, :orderdate => orderdate}
end

post '/shake_choice' do
	sandwich = params[:sandwich]
	side = params[:side]
	shake = params[:shake].gsub(' ', '-')
	orderdate = params[:orderdate]
	redirect '/order?sandwich=' + sandwich + '&side=' + side + '&shake=' + shake + '&orderdate=' + orderdate
end

get '/order' do
	sandwich = params[:sandwich].gsub('-', ' ')
	side = params[:side].gsub('-', ' ')
	shake = params[:shake].gsub('-', ' ')
	orderdate = params[:orderdate].gsub('-', ' ')
	erb :order, :locals => {:sandwich => sandwich, :side => side, :shake => shake, :orderdate => orderdate}
end