require 'nokogiri'
require 'pry'
require 'open-uri'

class FastCoScraper
  attr_accessor :url, :stories, :index_url

  def initialize
    @stories=[]
    @index_url="http://www.fastcompany.com"
    @url=Nokogiri::HTML(open(@index_url))
  end

  def get_stories

    @url.css("article")
  end

  def get_headline
    @url.css("article header h3 a").each_with_index do |headline, index|
      @stories[index]||={}
      @stories[index][:headline]=headline.text
    end
  end

  def get_image
    @url.css("figure img").each_with_index do |image, index|

      @stories[index]||={}
      if image != nil
        @stories[index][:image]=image.attr("src")
      else
        return "broken link"
      end
    end
  end
  # everything is under "article" tag
  # div.teaser
    # link-href. we must add it to fastco url
    # teaser

  # header h3
    # header text

  # article, figure, img 
    # img if exists

  # story1 = {:headline=>"H1", :img=>"url"}
 
end

binding.pry
