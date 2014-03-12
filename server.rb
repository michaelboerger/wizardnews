require 'sinatra'
require 'shotgun'
require 'csv'

get '/'  do
  @wizards=[]
   CSV.foreach('wizards.csv', headers: true) do |file|
    @wizards<<file
   end
  #read in CSV
  erb :index
end

get '/new-wizard-article'  do
  erb :new_wizard_article
end

post '/new-wizard-article' do
  @title=params['title']
  @url=params['url']
  @description=params['description']

  CSV.foreach('wizards.csv', headers: true) do |file|
    file.puts(@title)
    file.puts(@url)
    file.puts(@description)
  end
  redirect '/'
end

