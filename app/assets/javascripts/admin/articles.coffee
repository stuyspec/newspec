# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
form = $('form.edit_article')
hidden = form.find('input#article_text')
form.on 'submit', (e) ->
    hidden.val tinymce.activeEditor.getContent()
