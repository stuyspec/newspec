form = $('form.edit_article')
hidden = form.find('input#article_text')
form.on 'submit', (e) ->
    hidden.val tinymce.activeEditor.getContent()
