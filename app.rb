require './classes/get_url.rb'
require './classes/scraper.rb'
require 'nokogiri'
require 'open-uri'

tab = [["https://www.annuaire-des-mairies.com/martinique.html", 34],["https://www.annuaire-des-mairies.com/reunion.html", 24],["https://www.annuaire-des-mairies.com/yvelines", 262]]
def perform (url, y)
  @url = url
  tab = Array.new
  result = Array.new
  x = 0
  
  while (x < 260)
    lien = Get_url.new(@url, x)
    tab[x] = lien.get_url
    resultat = Scraper.new(tab[x])
    result[x] = resultat.get_info
    x = x + 1
  end
  return result
end

k = 0
#while (k < 3)
 # puts "Travail en cours, #{k + 1}/3"
  puts perform(tab[2][0], tab[2][1])
  #k = k + 1
#end










