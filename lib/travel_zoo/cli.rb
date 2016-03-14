class TravelZoo::CLI

# the call method will be executed through TravelZoo::CLI.new.call in bin file. 
#call method will call the other three methods that are fundations of the interface. 

  def call
    list_deals
    menu
    goodbye
  end

# the list_deals method will put the travel deals to console for the users to view.

  def list_deals
    puts "ATTENTION!!!Today's top 20 deals" 
    puts "-------------------------------------------------------"
    TravelZoo::Deal.scraper.each_with_index do |key, i| #call on ravelZoo::Deal.scraper and print and numerate each deal
    puts "#{i+1}. #{key.name}"
  end
  end

# the menu method will let the users choose the deal that they want to see the details. 

  def menu 
    input = nil 
    while input !="exit"  #unless the user input "exit" or "lsit" the loop will take a number from user and print out the detail of the corresponding deal
      puts "-------------------------------------------------------"
      puts "Select the deal you like to for more info!(Enter the number 1-20.Some deals may not have details).Enter a different number for different deal details"  
      puts "Enter 'list' back to deal list or 'exit' to exit the program"
      input = gets.strip.downcase #the input will be saved here
      puts "-------------------------------------------------------"
      if input.to_i > 0 && input.to_i <21 # make sure the number is between 1-20 since we only have 20 deals
        deal = TravelZoo::Deal.select_deal(input.to_i) #call on the select_deal method to select the deal since all the deals scraped are saved in @@deals
        display_details(deal) #after select the deall user wants to see more, call on display_details to show the details of the deal
      elsif input === "list" 
        TravelZoo::Deal.deals.clear
        list_deals   #call the list_deals method again if user wants to see the deal list again 
      else
        puts "Invalid input, please follow below instruction!"
      end
    end
  end


def display_details(deal)
  puts "#{deal.details}"  #shows the details of the deal, this method is based on scrape_details method in deal.rb
end

  def goodbye
    puts "See you tomorrow for more deals!" #method to show exit to the program 
  end
end