$ = require 'jquery'

module.exports = PostGetter =
  # api: "http://kinja.com/api/core/post"
  api: "http://kinja.com/api/core/corepost/getList"

  isLink: (link) ->
    link = @cleanLink(link)
    @newLink(link) or @oldLink(link)
  newLinkRe: /-(\d{8,11})$/
  newLink: (link) ->
    link.match(@newLinkRe)
  oldLinkRe: /\.com\/(\d+)\//
  oldLink: (link) ->
    link.match(@oldLinkRe)
  cleanLink: (link) ->
    link.split(/[+?#]/)[0].split(/\/$/)[0]
  postId: (link) ->
    link = @cleanLink(link)
    if @newLink(link)
      link.match(@newLinkRe)[1]
    else
      link.match(@oldLinkRe)[1]
  apiURL: (postId) ->
    "#{@api}?#{postId}"

  getPosts: (post_ids, complete) ->
    params = (post_ids.map (post_id) -> "id=#{post_id}").join('&')
    url = @apiURL(params)
    $.ajax
      url: url
      dataType: "jsonp"
      jsonp: 'jsonp'
      success: (response) =>
        type = $('input[name=roundup-type]:checked', '.radios').val()
        posts = response.data
        complete(posts) if complete? and posts?
