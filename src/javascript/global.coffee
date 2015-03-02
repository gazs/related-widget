# Browserify entry point for the global.js bundle (yay CoffeeScript!)

if window.location.search is ""
  console.log 'show builder'
  WidgetBuilder = require './widget_builder'
  WidgetBuilder.render()
else
  post_ids = window.location.search.match(/\?posts=(.*)/)[1].split(',')
  PostGetter = require './post_getter'
  PostView = require './post_view'

  PostView.init()
  for post_id in post_ids
    PostGetter.getPost post_id, (post) ->
      PostView.render(post)
