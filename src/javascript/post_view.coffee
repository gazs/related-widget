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
    if post.facebookImage?
      imgObj = post.facebookImage
      img = "<img src=\"#{img_url}/#{imgObj.id}.#{imgObj.format}\" />"
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
