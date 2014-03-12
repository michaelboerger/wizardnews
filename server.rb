require 'sinatra'
require 'shotgun'

get '/' do
  @title = File.readlines('wizards.csv')
  @url = File.readlines('wizards.csv')
  @description = File.readlines('wizards.csv')
  erb :index
end

post '/wizard-sum' do

  @title=params['title']
  @url=params['url']
  @description=params['description']


  File.open('wizards.csv', 'a') do |file|
    file.puts('title')
    file.puts('url')
    file.puts('description')
  end


  redirect '/'
end




# get "/" do
# @articles = []
# CSV.foreach(file) do
# #create article from file contents
# @articles << WizardArticle.new
# end
# erb :index
# end

# post "/create-article" do
# #create a wizard based on form values
# @article = WizardArticle.new
# @article.write_to_csv(file)
# redirect "/"
# end
