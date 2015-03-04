# Browserify entry point for the global.js bundle (yay CoffeeScript!)

if window.location.search is ""
  console.log 'show builder'
  WidgetBuilder = require './widget_builder'
  WidgetBuilder.render()
else
  post_ids = window.location.search.match(/\?posts=([\d,]+)/)[1].split(',')
  if window.location.search.match(/&title=(.*)/)
    title = decodeURIComponent window.location.search.match(/&title=(.*)/)[1]
  else
    title = "Recommended stories"
  PostGetter = require './post_getter'
  PostView = require './post_view'

  PostView.init(title)
  for post_id in post_ids
    PostGetter.getPost post_id, (post) ->
      PostView.render(post)
