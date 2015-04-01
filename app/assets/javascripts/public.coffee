# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $(".top-news").click (e)->
        el = e.currentTarget
        $(el).toggleClass("open")
        #console.log e
        return
    windowOptions = 'scrollbars=yes,resizable=yes,toolbar=no,location=yes'
    width = 550
    height = 420
    winHeight = screen.height
    winWidth = screen.width
    $('.social-action ul li a').on 'click', (event) ->
      href = $(this).attr('href')
      event.preventDefault()
      left = Math.round((winWidth / 2) - (width / 2))
      top = 0
      if winHeight > height
          top = Math.round((winHeight / 2) - (height / 2))
      window.open(href, 'DWFOCUS', windowOptions + ',width=' + width + ',height=' + height + ',left=' + left + ',top=' + top)
      return
    return
