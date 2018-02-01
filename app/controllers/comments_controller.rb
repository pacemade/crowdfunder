class CommentsController < ApplicationController

  def Create
    @comment = Comment.new
    @comment.text = params[:comment][:text]
    @comment.project = Project.find(params[:project_id])

    if @comment.save do
      redirect_to project_url(@comment.project)
    end
  end
end
