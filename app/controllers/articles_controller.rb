class ArticlesController < ApplicationController
	#before_action :validate_user, except: [:show,:index]
	#A ESTA RUTA SE ACCEDE CON: GET /articles
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_article, except: [:index,:new,:create] 
	def index 
		#Ob tiene todos los rgistros de la tabla Articles..
		@articles = Article.all
	end
	#GET /articles/:id
	def show 
		@article.update_visits_count
		#Encuen tra un registros segun el ID
		#@article = Article.find(params[:id])
		@comment = Comment.new
	end	
	#GET /articles/new 
	def new
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
		#@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end	
	#PUT /articles/
	def update
	  	#@article = Article.find(params[:id])
	  	if  @article.update(article_params)
	  		redirect_to @article
	  	else
	  		render :edit
	  	end
	end 
	private
	#def validate_user
		#redirect_to new_user_session_path, notice: "Para agregar un articulo necesitas Iniciar Sesion"
	#end
	def set_article
		@article = Article.find(params[:id])
	end
	def article_params
		params.require(:article).permit(:title,:body)
	end
end