$ = require 'jquery'

img_url = "http://i.kinja-img.com/gawker-media/image/upload/c_fill,fl_progressive,g_center,h_180,q_80,w_320"

module.exports = PostView =
  init: (title) ->
    $('body').append """
      <div class="stories">
        <h4>#{title}</h4>
      </div>
    """
  render: (post) ->
    img = post.data.facebookImage or post.data.parsedBody.facebookImage
    $('.stories').append """
        <div class="story">
          <a href="#{post.data.permalink}" target="_blank">
            <img src="#{img_url}/#{img.id}.#{img.format}" />
            <h5 class="headline">
              #{post.data.headline}
            </h5>
          </a>
        </div>
      """
