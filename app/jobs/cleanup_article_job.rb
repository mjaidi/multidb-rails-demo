class CleanupArticleJob < ApplicationJob
  queue_as :default

  def perform(article_id)
    article = Article.find(article_id)
    article.title = "#{article.title.strip} [CLEANED]"
    article.save
  end
end
