require './classes/get_url.rb'
require './classes/scraper.rb'
require 'nokogiri'
require 'open-uri'

tab = [["https://www.annuaire-des-mairies.com/pyrenees-orientales.html", 226],["https://www.annuaire-des-mairies.com/yvelines.html", 262],["https://www.annuaire-des-mairies.com/vaucluse.html", 151]]
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

puts perform(tab[1][0], tab[1][1])
