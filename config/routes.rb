######################
#  config/routes.rb  #
######################

require File.expand_path('../../app/helpers/adt_helper', __FILE__)
# "you're in #{__FILE__}" if ENV.fetch('RACK_ENV') == 'development'

class EotSite < Sinatra::Base

  def get_files(path)
    dir_list_array = []
    Find.find(path) do |f|
      dir_list_array << File.basename(f, '.*') unless File.directory?(f)
    end
    dir_list_array
  end

  def formatter(page)
    # formatted = ''
    formatted = page.gsub(/[-]/, ' ').capitalize
    formatted
  end

  def get_html_files(path)
    file_list = []
    Find.find(path) do |f|
      # file_list << File.basename(f) unless File.extname(f) != '.html'
      file_list << File.basename(f, '.*') unless File.directory?(f)
    end
    file_list
  end

  def prhtml_arr
    @prhtml_arr = get_html_files('./app/views/prhtml/')
    @prhtml_arr.sort
  end

  get '/prhtml' do
    erb :prhtml, layout_engine: :erb
  end

  get '/prhtmlview/:link' do
    halt 404 unless File.exist?("app/views/prhtml/#{params[:link]}.html")
    send_file "app/views/prhtml/#{params[:link]}.html"
  end

  def html_arr
    @html_arr = get_html_files('./app/views/html/')
    @html_arr.sort
  end

  get '/html' do
    send_file 'app/views/html/index.html'
    # erb :html, layout_engine: :erb
  end

  get '/htmlview/:link' do
    halt 404 unless File.exist?("app/views/html/#{params[:link]}.html")
    send_file "app/views/html/#{params[:link]}.html"
  end

  def erb_arr
    @erb_arr = get_files('./app/views/erb/')
    @erb_arr.sort
  end

  get '/erb' do
    erb :erb, layout_engine: :erb
  end

  get '/erbview/:link' do
    halt 404 unless File.exist?("app/views/erb/#{params[:link]}.erb")
    erb :"erb/#{params[:link]}", layout_engine: :erb
  end

  def md_arr
    @md_arr = get_files('./app/views/md')
    @md_arr.sort
  end

  get '/md' do
    erb :md, layout_engine: :haml
  end

  get '/mdview/:link' do
    halt 404 unless File.exist?("app/views/md/#{params[:link]}.md")
    markdown :"md/#{params[:link]}", layout_engine: :haml
  end

  def pdf_arr
    @pdf_arr = get_files('./app/views/pdf')
    @pdf_arr.sort
  end

  get '/pdf' do
    erb :pdf, layout_engine: :haml
  end

  get '/pdfview/:link' do
    halt 404 unless File.exist?("app/views/pdf/#{params[:link]}.pdf")
    send_file "app/views/pdf/#{params[:link]}.pdf"
  end

  def rd_arr
    @rd_arr = get_files('./app/views/rdoc')
  end

  get '/rdoc' do
    erb :rdoc, layout_engine: :haml
  end

  get '/rdview/:link' do
    halt 404 unless File.exist?("app/views/rdoc/#{params[:link]}.rdoc")
    rdoc :"rdoc/#{params[:link]}", layout_engine: :haml
  end

  get '/' do
    haml :home
  end

  get '/examples' do
    haml :examples
  end

  get '/graph' do
    haml :graph
  end

  get '/tutorial' do
    haml :tutorial
  end

  get '/datetime' do
    haml :datetime
  end

  get '/jcft' do
    haml :jcft
  end

  get '/mean' do
    haml :mean
  end

  get '/eqc' do
    haml :eqc
  end

  get '/ecliplon' do
    haml :ecliplon
  end

  get '/rghtascn' do
    haml :rghtascn
  end

  get '/final' do
    haml :final
  end

  get '/eot' do
    haml :eot
  end

  get '/mysuntimes' do
    haml :mysuntimes
  end

  get '/links' do
    haml :links
  end

  get '/gm' do
    haml :gmm
  end

  get '/analemma' do
    @page = AnalemmaDataTable.new
    haml :analemma
  end

  get '/sider' do
    haml :sider
  end  

  get '/today' do
    haml :today
  end

  get '/justin' do
    haml :justin
  end

  not_found do
    haml :not_found
  end

  get '/example' do
    haml :example_view
  end

  get '/throw/:type' do
    content_type :html
    @defeat = { rock: :scissors, paper: :rock, scissors: :paper }
    @throws = @defeat.keys
    # the params[] hash stores querystring and form data.
    player_throw = params[:type].to_sym
    # in the case of a player providing a throw that is not valid,
    # we halt with a status code of 403 (Forbidden) and let them
    # know they need to make a valid throw to play.
    unless @throws.include?(player_throw)
      halt 403, "<h1>You must throw one of the following: #{@throws}</h1>"
    end

    # now we can select a random throw for the computer
    computer_throw = @throws.sample
    # compare the player and computer throws to determine a winner
    if player_throw == computer_throw
      '<h1>You tied with the computer. Try again!</h1>'
    elsif computer_throw == @defeat[player_throw]
      "<h1>Nicely done; #{player_throw} beats #{computer_throw}!</h1>"
    else
      "<h1>Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!</h1>"
    end
  end
end
