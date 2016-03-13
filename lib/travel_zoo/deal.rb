class TravelZoo::Deal
  attr_accessor:name,:details,:url

  @@deals = []

  def initialize(name = "", url = "")
    @name = name
    @url = url
    @details = details
    scrape_details
  end

  def self.scraper
    doc = Nokogiri::HTML(open("http://www.travelzoo.com/top20/"))
      doc.css("span.tzsg-h2 a").each do |deal|
        deal_name = deal.text.strip
        deal_url = deal.attr("href")
        deal = self.new(deal_name,deal_url)
        @@deals << deal
    end
    self.deals
  end

  def scrape_details
    doc = Nokogiri::HTML(open(@url))
    @details = doc.css("div.dealText").text
  end

  def self.select_deal(input)
    @@deals[input-1]
  end

  def self.deals
    @@deals
  end

end