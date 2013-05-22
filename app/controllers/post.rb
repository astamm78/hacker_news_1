get '/submit' do
  session[:last_page] ='/submit'
  if session[:username]
    erb :submit
  else
    erb :login, :locals => {:errors => "You need to be signed in to do that."}
  end
end

post '/submit' do
  url = params[:url]
  post = Post.create(:user_id => current_user.id, :url => url, :title => Post.title(url))
  redirect "/post/#{post.id}"
end

get '/post/:post_id' do
  session[:last_page] = "/post/#{params[:post_id]}"
  erb :post, :locals => { :post => Post.find(params[:post_id]) }
end

post '/post/:post_id' do
  post = Post.find(params[:post_id])
  post.comments << Comment.create(:content => params[:comment_text], :user_id => current_user.id)
  redirect "/post/#{post.id}"  
end
