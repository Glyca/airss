class Article
  attr_accessor :title, :date, :description, :url, :image

  def initialize(title, date, description, url, image)
    @title = title
    @date = date
    @description = description
    @url = url
    @image = image
  end
end

class Flux < ActiveRecord::Base

  def items
    SimpleRSS.item_tags << :'enclosure#url'
    rss = SimpleRSS.parse open(self.url)
    puts rss.inspect
    coder = HTMLEntities.new
    articles = Array.new
      rss.items.each {|article|
        description = coder.decode(article.description.force_encoding('UTF-8'))
        articles.push Article.new(article.title.force_encoding('UTF-8'),article.pubDate, description, article.link, article.enclosure_url)
        }
    articles
  end
end
