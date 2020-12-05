class VotesController < ApplicationController
  def new
    vote = Vote.new(user_id: session[:current_user]['id'], article_id: params[:article_id])

    if vote.save
      redirect_to article_path(params[:article_id]), notice: 'Vote registered successfully'
    else
      redirect_to root_path, notice: 'An error occurred while trying to register this vote'
    end
  end

  def edit
    Vote.delete(params[:id])
    redirect_to root_path, notice: 'Vote successfully deleted'
  end
end
