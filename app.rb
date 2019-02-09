require "bundler/setup"
require "sinatra"
require "sinatra/reloader"
require "active_record"

ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "./bbs.db"
)

class Comment < ActiveRecord::Base
end

get "/" do
    @title = "My site"
    @comments = Comment.all
    erb :index
end

post '/create' do
    Comment.create(body: params[:body],gender: params[:gender]) 
    redirect to('/')
end

