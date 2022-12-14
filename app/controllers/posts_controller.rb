class PostsController < ApplicationController
    before_action :authenticate_account!, except: [ :index, :show ]
    before_action :set_post, only: [:show]
    before_action :auth_subscriber, only: [:new]

    def index
        @post = Post.all
    end

    def show
        @comment = Comment.new
    end

    def new
        @community = Community.find(params[:community_id])
        @post = Post.new
    end

    def create
        @post = Post.new post_values
        @post.account_id = current_account.id
        @post.community_id = params[:community_id]

        if @post.save
            redirect_to community_path(@post.community_id)
        else
            @community = Community.find(params[:community_id])
            render :new
        end
    end

    def set_post
        @post = Post.includes(:comments).find(params[:id])

    end

    private

    def post_values
        params.require(:post).permit(:title, :body)
    end

    def auth_subscriber
        unless Subscription.where(community_id: params[:community_id], account_id: current_account.id).any?
            redirect_to root_path, flash: {danger: "Please log in to view this page"}
        end
    end

end