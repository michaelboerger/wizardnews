require 'sinatra'
require 'shotgun'

get '/' do
  @wizards = File.readlines('wizards.csv')
  erb :index
end

post '/wizards' do

  wizards = params['task_name']


  File.open('wizards.csv', 'a') do |file|
    file.puts(wizards)
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
