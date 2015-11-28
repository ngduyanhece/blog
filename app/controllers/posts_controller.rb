class PostsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :edit]
	def index
		@posts = Post.order('created_at desc').paginate(:page => params[:page], :per_page => 5)
	end

	def show 
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comment.post = @post
	end

	def new 
		@post = Post.new 
	end

	def create 
		@post = Post.create(post_params)
		if @post.save 
			flash[:notice] = "Post Created"
			redirect_to @post 
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id]) 
	end

	def update
		@post = Post.find(params[:id]) 
		if @post.update(post_params)
			flash[:notice] = "Post Update"
			redirect_to @post 
		else
			render 'eidt'
		end
	end

	private 
		def post_params 
			params.require(:post).permit([:title,:content,:excerpt,category_ids: []])
		end
end
