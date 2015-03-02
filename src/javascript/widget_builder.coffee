$ = require 'jquery'
PostGetter = require './post_getter'

module.exports = WidgetBuilder =
  post_ids: []
  render: ->
    # debugger
    $('body').append """
      <div class="builder">
      <div class="container">
        <form action="">
          <input type="text" class="link_input" placeholder="Paste links..." />
        </form>
        <div class="result" contenteditable="true"></div>
        <textarea class="embed"></textarea>
      </div>
      </div>
      """

    $('.link_input, .embed').on 'click', (e) ->
      $(@).select()
    $('.link_input').on 'keyup', (e) ->
      $(@).blur()
      $(@).focus()
    $('.link_input').on 'change', (e) =>
      el = e.currentTarget
      link = $(el).val().split('#')[0].split('+')[0]
      if PostGetter.isLink(link)
        post_id = PostGetter.postId(link)
        @post_ids.push post_id
        iframe = """
            <iframe src="#{window.location.href}?posts=#{@post_ids.reverse().join(',')}" width="100%" height="240" class="custom aspect recommended"></iframe>
          """
        $('.result').html(iframe)
        $('.embed').val(iframe)
        $('.link_input').select()
        # PostGetter.getPost link, (post) =>
        #   debugger
