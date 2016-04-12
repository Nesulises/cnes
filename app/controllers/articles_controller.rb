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
		#Este es el Insert into
		#Esta es la antigua ->
		#@article = Article.new(title: params[:article][:title], body: params[:article][:title])
		@article = Article.new(article_params)
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
	private
	def article_params
		params.require(:article).permit(:title,:body)
	end
end