require 'random_data'

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end

 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
uniqPost = Post.find_or_create_by!(
   title: "Some Post",
   body: "This is the body of some post"
)

Comment.find_or_create_by!(
   post: Post.find(uniqPost.id),
   body: "This is the body of some comment"
)

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
