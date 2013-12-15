class RepliesController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @reply = @product.replies.build(reply_params)

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @product, notice: 'Reply created successfully!' }
        format.js
      else
        format.html { render 'products/show' }
        format.js
      end
    end
  end

  private
    def reply_params
      params.require(:reply).permit(:product_id, :name, :email, :content)
    end
end
