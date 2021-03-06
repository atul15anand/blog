class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Article is deleted"
		redirect_to articles_path
	end

	def create
		@article =Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was created successfully"
			redirect_to article_path(@article) #redirect to the show 
		else
			render 'new' #else new form empty wala is displayed
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article is updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	private
	def article_params
		params.require(:article).permit(:title, :description)
	end

	def articles_show

	end
end