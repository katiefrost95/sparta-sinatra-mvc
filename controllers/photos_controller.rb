class PhotosController < Sinatra::Base #double colon means module, in sinatra class called base which we'll inherit from

  set :root, File.join(File.dirname(__FILE__), "..") #sets root at the parent directory of the current file

  set :views, Proc.new { File.join(root, "views") } #telling server where to look for the views so we can put views in separate folder

  configure :development do
    register Sinatra::Reloader #enabling reloader to happen in config.ru
  end

  $photos = [{
  	 id: 0,
  	 title: "Photo 1",
  	 body: "This is the first post",
     img: "https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Natural-Dog-Law-2-To-dogs%2C-energy-is-everything.jpg?itok=Z-ujUOUr"
  },
  {
      id: 1,
      title: "Photo 2",
      body: "This is the second post",
      img: "http://www.franklincountydogs.com/adopt/assets/images/adoptable-size.jpg"
  },
  {
      id: 2,
      title: "Photo 3",
      body: "This is the third post",
      img: "http://hdfreewallpaper.net/wp-content/uploads/2015/12/Pretty-Dog-wallpaper-puppies-free-hd-for-desktop.jpg"
  }];

  get "/" do # means route so saying when you see this route give back a string
    @title = "Photo Homepage"
    erb :'photos/home' #linking page to index.erb html page, dont need to specify its in views because of what we wrote above
  end

  get "/photos" do #another route/listener
    @title = "Photos"
    @photos =$photos  #wanna show all photos on page so photoS
    erb :'photos/index'
  end

  get "/photos/new" do
    @photo = $photos
    erb :'photos/new'
  end

  get "/photos/:id" do #always must be :id - dont forget colon, can put any word in placehold not just 'id'
    id = params[:id].to_i #gonna access whats put in route of this variable
    @photo = $photos[id] #gonna pull out photo that has same id as one we've typed in
    erb :'photos/show'
  end

  get "/photos/:id/edit" do
    @photo = $photos
    erb :'photos/edit'
  end

  put '/photos/:id' do
    "UPDATE: #{Params[:id]}"
  end

  delete "/photos/:id" do
    id = params[:id]
    "Delete: #{id}"
  end

end
