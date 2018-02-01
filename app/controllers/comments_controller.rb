class CommentsController < ApplicationController

  # def new
  #   @comment = Comment.new
  # end

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new
    @comment.text = params[:comment][:text]
    @comment.project = Project.find(params[:project_id])



    if @comment.save
      redirect_to project_url(@comment.project)
    end
  end
end
