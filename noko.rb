require 'rubygems'
require 'nokogiri'
require 'open-uri'
 
#This code get the email of a townhal from its webpage 
def get_the_email_of_a_townhal_from_its_webpage(page_url)
    page = Nokogiri::HTML(open(page_url))
    elements = page.css('.txt-primary')[3].text.split(" ")[2]
    puts elements
 
end
puts get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")

#This code get all the urls of val doise townhalls
def get_all_the_emails_of_val_doise_townhalls(page_url)
    page = Nokogiri::HTML(open(page_url))
 
    towns_directory = Hash.new(0)
 
    page.css("a.lientxt").each_with_object(towns_directory) do |townhall, hash|
        town_name = townhall.text
        link = "http://annuaire-des-mairies.com" + townhall['href'][1..-1]
        email = get_the_email_of_a_townhal_from_its_webpage(link)
    end
 
end
puts get_all_the_emails_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")