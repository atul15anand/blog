class ArticlesController < ApplicationController
	def new
		@article = Article.new
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

	def show
		@article = Article.find(params[:id])
	end

	private
	def article_params
		params.require(:article).permit(:title, :description)
	end

	def articles_show

	end
end