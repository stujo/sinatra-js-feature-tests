require 'sinatra'
require 'sinatra/json'

def eight_ball
  [
    'Definitely',
    'Most likely',
    'Try again',
    'Cannot predict now',
    "Don't count on it",
    'Yes',
    'No',
    'For Sure'
  ].sample
end

get '/' do
  erb :index
end

post '/answer' do
  @reply = eight_ball

  if request.xhr?
    erb :partial_answer
  else
    erb :answer
  end
end
