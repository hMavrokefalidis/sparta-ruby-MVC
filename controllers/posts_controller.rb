class PostsController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
    	 id: 0,
    	 title: "Post 1",
    	 body: "This is the first post"
    },
    {
        id: 1,
        title: "Post 2",
        body: "This is the second post"
    },
    {
        id: 2,
        title: "Post 3",
        body: "This is the third post"
    }];

  # INDEX
  get "/" do
    @title = "Blog Posts"
    @posts = $posts
    erb :"posts/index"
  end

  # NEW
  get "/new" do
    "This is the new route!"
  end

  # SHOW
  get "/:id" do
    id = params[:id].to_i
    @post = $posts[id]

    erb :"posts/show"
  end

  # CREATE
  post "/" do
    "This is the create route!"
  end

  # EDIT
  get "/:id/edit" do
    id = params[:id]
    "This is the edit route for #{id}"
  end

  # UPDATE
  put "/:id" do
    id = params[:id]
    "This is the update route for #{id}"
  end

  # DESTROY
  delete "/:id" do
    id = params[:id]
    "This is the delete route for #{id}"
  end

end
