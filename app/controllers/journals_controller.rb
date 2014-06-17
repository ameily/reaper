class CommentsController < ApplicationController
    def create
        @soul = Soul.find(params[:soul_id])
        #redirect_to soul_path(@soul)
        @comment = @soul.comments.create(comment_params)
        
        respond_to do |format|
            format.json { render json: @comment, status: :created }
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        respond_to do |format|
            if @comment.destroy
                format.json { render json: { }, status: :ok }
            else
                
            end
        end
    end
 
    private def comment_params
        params.require(:comment).permit(:body)
    end
end
