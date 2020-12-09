module VotesHelper
  def allowed_to_vote?(article)
      if logged_in?
        return "d-flex" if session[:current_user]['id'].to_i != article.author.id
        "d-none"
      else
        "d-none"
      end
  end

  def voted?(article)
    return false if (session[:current_user].nil?)
    return true if article.votes.find_by(user_id: session[:current_user]['id']).present?
  end

  def confirmation(article)
    return {confirm: 'Are you sure?'} if voted?(article)
  end

  def class_voted(article)
    return "disable" if voted?(article)
  end

  def message_vote(article)
    !voted?(article) ? "Add vote" : "Delete vote"
  end

  def find_vote_id(article)
    article.votes.find_by(user_id: session[:current_user]['id']).id
  end

  def action_vote(article)
    if voted?(article)
      return edit_votes_path(id: find_vote_id(article))
    else
      return new_votes_path(article_id: article.id)
    end
  end
end
