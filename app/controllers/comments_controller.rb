class CommentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "123456", only: [:destroy]
  
  before_filter :create, :only => :check_comment
  
  def create
    @location = Location.find(params[:location_id])
    @comment = @location.comments.create(comment_params)
    redirect_to location_path(@location)
  end
  
  def destroy
    @location = Location.find(params[:location_id])
    @comment = @location.comments.find(params[:id])
    @comment.destroy
    redirect_to location_path(@location)
  end
  
  def check_comment(body)
    @safe = CommentsFilter::IsFiltered.comment_filter(body)
    if @safe == false
      body = "Your comment is pending"
    end
    return body
  end
  
  private
    def comment_params
      params.require(:comment).permit(:username, :body)
    end
    
end
