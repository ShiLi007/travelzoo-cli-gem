class TravelZoo::CLI

  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts "ATTENTION!!!Today's top 20 deals" 
    puts "-------------------------------------------------------"
    TravelZoo::Deal.scraper.each_with_index do |key, i|
    puts "#{i+1}. #{key.name}"
  end
  end

  def menu 
    input = nil
    while input !="exit"
      puts "-------------------------------------------------------"
      puts "Select the deal you like to for more info!(Enter the number 1-20.Some deals may not have details).Enter a different number for different deal details"  
      puts "Enter 'list' back to deal list or 'exit' to exit the program"
      input = gets.strip.downcase
      puts "-------------------------------------------------------"
      if input.to_i > 0 && input.to_i <21
        deal = TravelZoo::Deal.select_deal(input.to_i)
        display_details(deal)
      elsif input === "list" 
        list_deals   
      else
        puts "Invalid input, please follow below instruction!"
      end
    end
  end


def display_details(deal)
  puts "#{deal.details}"
end

  def goodbye
    puts "See you tomorrow for more deals!"
  end
end