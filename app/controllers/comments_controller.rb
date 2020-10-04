class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.new(comment_params.merge(post_id: params[:post_id]))
    @post = Post.find(params[:post_id])
    respond_to do |format|
      if @comment.save
        format.html {
          redirect_to "/posts/#{@comment.post_id}",
          notice: 'Comentario creado con exito.'
        }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @post,
                      alert: 'Complete todos los campos para crear un comentario.' }
        format.json {
          render json: @comment.errors, status: :unprocessable_entity
        }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :last_name, :body)
  end
end
