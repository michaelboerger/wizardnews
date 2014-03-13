require 'sinatra'
require 'shotgun'
require 'csv'
require 'pry'
require_relative 'lib/wizard_class'

get '/'  do
  @wizards = []
  CSV.foreach('wizards.csv', headers: true) do |object|
    @wizards << WizardClass.new(object[0], object[1], object[2])
  end
  erb :index
end

get '/new-wizard-article'  do
  erb :new_wizard_article
end

post '/new-wizard-article' do
  @title = params['title']
  @url = params['url']
  @description = params['description']

  CSV.open('wizards.csv', 'ab') do |file|
    file << [@title, @url, @description]
  end
  redirect '/'
end
