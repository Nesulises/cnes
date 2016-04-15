class ArticlesController < ApplicationController
	#A ESTA RUTA SE ACCEDE CON: GET /articles
	def index 
		#Ob tiene todos los rgistros de la tabla Articles..
		@articles = Article.all
	end
	#GET /articles/:id
	def show 
		#Encuentra un registros segun el ID
		@article = Article.find(params[:id])
	end	
	#GET /articles/new 
	def new
		#
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id]) 
	end
	#POST /articles 
	def create 
		#Este es el Insert into
		#Esta es la antigua ->
		#@article = Article.new(title: params[:article][:title], body: params[:article][:title])
		@article = current_user.articles.new(article_params)
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
	#PUT /articles/
	def update
	  	@article = Article.find(params[:id])
	  	if  @article.update(article_params)
	  		redirect_to @article
	  	else
	  		render :edit
	  	end
	end 
	private
	def article_params
		params.require(:article).permit(:title,:body)
	end
end