getHTML = ->
  dom = document.implementation.createDocument '','html'
  html = dom.children[0]
  #html.appendChild(dom.createElement 'p') # add a <p> tag to the <html> tag
  
  _.forEach quill.getContents().ops, (op) ->
    last = html.lastChild
    if op.insert == "\n"
      console.log('newline')
    else
      nodes = op.insert.split("\n").map (text) ->
        p = dom.createElement('p')
        p.textContent = text
        return p

      _.forEach nodes, (node) ->
        html.appendChild(node) unless node.textContent == ''
        
  return dom