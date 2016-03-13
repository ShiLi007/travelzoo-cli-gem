class TravelZoo::Deal
  attr_accessor:name,:details,:url 

  @@deals = []  #the array will store all the deals scraped from the website 

  def initialize(name = "", url = "")
    @name = name
    @url = url
    @details = details
    scrape_details
  end

  def self.scraper 
    doc = Nokogiri::HTML(open("http://www.travelzoo.com/top20/")) # HTTP request by open--URI and scraping the deals using Nokogiri
      doc.css("span.tzsg-h2 a").each do |deal| #CSS selectors to retrieve the intended piece of data
        deal_name = deal.text.strip #store the data in variables to be used to initialize instances 
        deal_url = deal.attr("href")
        deal = self.new(deal_name,deal_url) #create new instance of deal 
        @@deals << deal #store each deal to the array 
    end
    self.deals #return @@deals
  end

  def scrape_details  #again,further scraped the detail of each deal through another scraping method
    doc = Nokogiri::HTML(open(@url))
    @details = doc.css("div.dealText").text 
  end

  def self.select_deal(input) #show a deal by index(or input-1) in the deals array,this is how user choose a number to see the deal
    @@deals[input-1]
  end

  def self.deals #shows the deals in the deals array 
    @@deals
  end

end