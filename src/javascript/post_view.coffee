$ = require 'jquery'

img_url = "http://i.kinja-img.com/gawker-media/image/upload/c_fill,fl_progressive,g_center,h_180,q_80,w_320"

module.exports = PostView =
  init: (title) ->
    $('body').append """
      <h4>#{title}</h4>
      <div class="stories">
      </div>
    """
  render: (post) ->
    img = post.facebookImage or post.parsedBody.facebookImage
    $('.stories').append """
        <div class="story">
          <a href="#{post.permalink}" target="_blank" onclick=recommendedClick("#{post.permalink}")>
            <img src="#{img_url}/#{img.id}.#{img.format}" />
            <h5 class="headline">
              #{post.headline}
            </h5>
          </a>
        </div>
      """
