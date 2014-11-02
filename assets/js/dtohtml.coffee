newDom = -> document.implementation.createDocument('','html')
dom = newDom()
addP = (dom, text) ->
  dom = dom.cloneNode(dom.DOCUMENT_NODE)
  p = dom.createElement('p')
  p.textContent = text
  dom.childNodes[0].appendChild(p)
  return dom

f = quill.getContents().ops.reduce (prev, current, index, array) ->
  addP(prev, current.insert)
, dom
