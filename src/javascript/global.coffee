# Browserify entry point for the global.js bundle (yay CoffeeScript!)

post_ids = window.location.search.match(/\?posts=(.*)/)[1].split(',')
PostGetter = require './post_getter.coffee'
PostView = require './post_view.coffee'

# post_id = PostGetter.postId('http://internet.gawker.com/the-creeps-of-reddit-are-outraged-over-new-masturbation-1688888027/+tcberman')

for post_id in post_ids
  PostGetter.getPost post_id, (post) ->
    PostView.render(post)
