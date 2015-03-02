$ = require 'jquery'

module.exports = PostGetter =
  api: "http://kinja.com/api/core/post"

  isLink: (link) ->
    @newLink(link) or @oldLink(link)
  newLink: (link) ->
    link.match(/-(\d+)\/?/)
  oldLink: (link) ->
    link.match(/\.com\/\d+\//)
  postId: (link) ->
    if @newLink(link)
      link.match(/-(\d+)\/?/)[1]
    else
      link.match(/\.com\/(\d+)\//)[1]
  apiURL: (postId) ->
    "#{@api}/#{postId}"

  getPost: (postId, complete) ->
    url = @apiURL(postId)
    console.log "getting #{url}"
    $.ajax
      url: url
      dataType: "jsonp"
      jsonp: 'jsonp'
      success: (post) =>
        type = $('input[name=roundup-type]:checked', '.radios').val()
        if post.data.starterId is post.data.id
          complete(post) if complete?
        else
          complete(post) if complete?
