class TesteWorker
  include Sidekiq::Worker

  def perform(url)
      browser = Watir::Browser.new :firefox, headless: true
      browser.goto(url)
      noko_html = Nokogiri::HTML.parse(browser.html) ## https://www.zapimoveis.com.br/aluguel/imoveis/sp+sao-paulo/
      @crawler = Crawler.new(url: url, body: noko_html.text)
      @crawler.save
  end
end
