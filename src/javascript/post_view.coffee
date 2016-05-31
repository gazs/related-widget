$ = require 'jquery'

img_url = "https://i.kinja-img.com/gawker-media/image/upload/c_fill,fl_progressive,g_center,h_180,q_80,w_320"

module.exports = PostView =
  width: $(window).width()
  init: (title) ->
    $('body').append """
      <div class="container">
        <h4>#{title}</h4>
        <div class="stories">
        </div>
        <br clear="all">
      </div>
    """
    $(window).resize =>
      @resize() unless @width is $(window).width()
  render: (post) ->
    if post.facebookImage?
      imgObj = post.facebookImage
      img = "#{img_url}/#{imgObj.id}.#{imgObj.format}"
    else
      domain = post.permalinkHost.match(/https?:\/\/(\w+\.)?(\w+)\.com/)[2]
      img = "images/#{domain}_related.png"
    $('.stories').append """
        <div class="story">
          <a href="#{post.permalink}" target="_blank" onclick=recommendedClick("#{post.permalink}")>
            <img src="#{img}" />
            <h5 class="headline">
              #{post.headline}
            </h5>
          </a>
        </div>
      """
    @resize()
    setTimeout @resize, 1000


  resize: ->
    # console.log 'RESIZE!!!'
    @width = $(window).width()
    height = $('.container').height()
    window.top.postMessage(
      JSON.stringify(
        kinja:
          sourceUrl: window.location.href
          resizeFrame:
            height: height
      ), '*'
    )

