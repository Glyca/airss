class Flux < ActiveRecord::Base

  def items
    rss = SimpleRSS.parse open(self.url)
    coder = HTMLEntities.new
    rss.items.each do |article|
    article.description = coder.decode(article.description)
    end
    rss.items
  end
end
