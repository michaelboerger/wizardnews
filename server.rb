require 'sinatra'
require 'shotgun'
require 'csv'

get '/'  do
  @wizards=[]
   CSV.foreach('wizards.csv') do |file|
    @wizards<<file.to_s
   end
  #read in CSV
  erb :index
end

get '/new-wizard-article'  do
  erb :new_wizard_article
end

post '/new-wizard-article' do
  @title=[]
  @url=[]
  @description=[]
  @title<<params['title']
  @url<<params['url']
  @description<<params['description']

  CSV.open('wizards.csv', 'wb') do |file|
      file<<@title
      file<<@url
      file<<@description
  end
  redirect '/'
end

