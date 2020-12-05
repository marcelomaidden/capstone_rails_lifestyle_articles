module VotesHelper
  def allowed_to_vote?(article)
    return false if session[:current_user].nil?
    return true if session[:current_user]['id'].to_i != article.author.id
  end

  def voted?(article)
    return true if article.votes.find_by(user_id: session[:current_user]['id']).present?
  end

  def find_vote_id(article)
    article.votes.find_by(user_id: session[:current_user]['id']).id
  end
end
