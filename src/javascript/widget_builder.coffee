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
        <input type="text" class="header_input" placeholder="Default header is 'Recommended stories'; to customize, enter text here and press 'Enter'" />
        <textarea class="embed"></textarea>
      </div>
      </div>
      """

    $('.link_input, .embed, .header_input').on 'click', (e) ->
      $(@).select()
    $('.link_input').on 'keyup', (e) ->
      $(@).blur()
      $(@).focus()
    $('.header_input').on 'change', (e) =>
      iframe = """
          <iframe src="#{window.location.href}?posts=#{@post_ids.reverse().join(',')}&title=#{$('.header_input').val() or "Recommended stories"}" width="636" height="250" class="custom recommended" id="editorial_labs_recommended_stories_widget"></iframe>
        """
      $('.result').html(iframe)
      $('.embed').val(iframe)
      # $('.link_input').select()
    $('.link_input').on 'change', (e) =>
      el = e.currentTarget
      link = $(el).val().split('#')[0].split('+')[0]
      if PostGetter.isLink(link)
        post_id = PostGetter.postId(link)
        @post_ids.push post_id
        iframe = """
            <iframe src="#{window.location.href}?posts=#{@post_ids.reverse().join(',')}&title=#{encodeURIComponent $('.header_input').val() or "Recommended stories"}" width="636" height="250" class="custom recommended" id="editorial_labs_recommended_stories_widget"></iframe>
          """
        $('.result').html(iframe)
        $('.embed').val(iframe)
        $('.link_input').select()
        # PostGetter.getPost link, (post) =>
        #   debugger
