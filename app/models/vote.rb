class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def categories
    article.categories
  end
end
