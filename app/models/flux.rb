class Article
  attr_accessor :title, :date, :description

  def initialize(title, date, description)
    @titre = title
    @date = date
    @description = description
  end
end

class Flux < ActiveRecord::Base

  def items
    rss = SimpleRSS.parse open(self.url)
    coder = HTMLEntities.new
    articles = Array.new
      rss.items.each {|article|
        description = coder.decode(article.description.force_encoding('UTF-8'))
        articles.push Article.new(article.title.force_encoding('UTF-8'),article.pubDate, description)
        }
    articles
  end
end
