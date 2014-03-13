require 'sinatra'
require 'shotgun'
require 'csv'
require 'pry'

get '/'  do
  @wizards=[]
   CSV.foreach('wizards.csv', headers: true) do |file|
    @wizards << file[0].to_s
    @wizards << file[1].to_s
    @wizards << file[2].to_s
   end
  # read in CSV
  erb :index
end

get '/new-wizard-article'  do

  erb :new_wizard_article
end

post '/new-wizard-article' do

  @title=params['title']
  @url=params['url']
  @description=params['description']

  CSV.open('wizards.csv', 'ab') do |file|

      file << [@title, @url, @description]
      # file<<@title
      # file<<@url
      # file<<@description
  end
  redirect '/'
end

