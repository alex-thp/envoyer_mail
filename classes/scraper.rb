class Scraper
  attr_accessor :url
  
  def initialize (url)
    @url = url
  end

  def get_info
    tab = Array.new
    page = Nokogiri::HTML(open(@url))
    mail = page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    commune = page.xpath('/html/body/div/main/section[1]/div/div/div/h1').text.slice(0..-9)
    code_postal = page.xpath('/html/body/div/main/section[1]/div/div/div/h1').text.slice(-5..-1)
    tab[0] = mail
    tab[1] = commune
    tab[2] = code_postal
    return tab
  end

end
