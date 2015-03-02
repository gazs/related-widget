$ = require 'jquery'

img_url = "http://i.kinja-img.com/gawker-media/image/upload/c_fill,fl_progressive,g_center,h_180,q_80,w_320"

module.exports = PostView =
  render: (post) ->
    # debugger
    $('.stories').append """
        <div class="story">
          <a href="#{post.data.permalink}">
            <img src="#{img_url}/#{post.data.parsedBody.facebookImage.id}.#{post.data.parsedBody.facebookImage.format}" />
            <h5 class="headline">
              #{post.data.headline}
            </h5>
          </a>
        </div>
      """
