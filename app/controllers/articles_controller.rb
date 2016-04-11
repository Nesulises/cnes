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
	def new
		#
		@article = Article.new
	end
	#POST /articles 
	def create
		@article = Article.new(title: params[:article][:title], body: params[:article][:body])
		if @article.save
			redirect_to @article
		else
			render :new
		end
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end	
	def update
		
	end
end