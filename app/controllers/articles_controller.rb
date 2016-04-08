class ArticlesController < ApplicationController
	#A ESTA RUTA SE ACCEDE CON: GET /articles
	def index 
		#Ob tiene todos los rgistros de la tabla Articles..
		@articles = Article.all
	end
	#GET /articles/:id
	def show 
		#Encuentra un registros segun el ID
		@articles = Article.find(params[:id])
	end	
	#GET /articles/new 

end