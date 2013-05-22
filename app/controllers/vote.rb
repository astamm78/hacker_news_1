post '/post/:post_id/vote_up' do
  Postvote.create(:post_id => params[:post_id], :user_id => current_user.id, :vote => 1)
  post = Post.find(params[:post_id])
  return "#{post.postvotes.where(:vote => 1).count} upvotes (#{post.postvotes.count}) total votes"
end

post '/post/:post_id/vote_down' do
  Postvote.create(:post_id => params[:post_id], :user_id => current_user.id, :vote => 0)
  post = Post.find(params[:post_id])
  return "#{post.postvotes.where(:vote => 1).count} upvotes (#{post.commentvotes.count}) total votes"
end

post '/comment/:comment_id/vote_up' do
  Commentvote.create(:comment_id => params[:comment_id], :user_id => current_user.id, :vote => 1)
  comment = Comment.find(params[:comment_id])
  return "#{comment.commentvotes.where(:vote => 1).count} upvotes (#{comment.commentvotes.count}) total votes"
end

post '/comment/:comment_id/vote_down' do
  Commentvote.create(:comment_id => params[:comment_id], :user_id => current_user.id, :vote => 0)
  comment = Comment.find(params[:comment_id])
  return "#{comment.commentvotes.where(:vote => 1).count} upvotes (#{comment.commentvotes.count}) total votes"
end
