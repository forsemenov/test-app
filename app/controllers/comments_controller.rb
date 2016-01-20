class CommentsController < ApplicationController
    def create
        @comment = Comment.create(post_params)
    end

    private

      def post_params
        params.require(:comment).permit(:post_id, :body)
      end
end
