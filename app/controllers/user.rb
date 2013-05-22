get '/login' do
  if current_user
    redirect "/user/#{current_user.username}"
  else
    erb :login, :locals => {:errors => nil}
  end
end

post '/login' do
  if User.authenticate( params[:username], params[:password] )
    session[:username] = params[:username]
    redirect session[:last_page]
  else
    erb :login, :locals => {:errors => "You done messed up."}
  end
end

post '/create_account' do
  new_user = User.create( :username => params[:username],
                          :email => params[:email],
                          :password => params[:password] )
  if new_user.save
    session[:username] = new_user.username 
    redirect session[:last_page]
  else
    erb :login, :locals => {:errors => "You done messed up."}
  end
end

get '/logout' do
  session[:username] = nil
  redirect "/"
end

get '/user/:username' do
  erb :user, :locals => { :user => User.find_by_username(params[:username]) }
end

get '/user/:username/posts' do
  erb :user_posts, :locals => { :user => User.find_by_username(params[:username]) }
end

get '/user/:username/comments' do
  erb :user_comments, :locals => { :user => User.find_by_username(params[:username]) }
end
