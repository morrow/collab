class window.Editor
  
  constructor: (mode, element)->
    window.allow_text_edits =
      html: true
      css: true
      javascript: true
    window.print = (inputs...)->
      div = document.createElement('div')
      div.innerHTML = inputs.join(' ')
      $('#output')[0].appendChild(div)
    if mode? and element?
      return @createCodeMirror(mode, element)

  createCodeMirror:(mode, element)->
    element.value = unescape(unescape(element.value))
    _mode = mode
    _mode = 'xml' if mode is 'html'
    editor = CodeMirror.fromTextArea element,
      theme:'monokai'
      lineNumbers:true
      mode: _mode
      indentWithTabs: false
      indentUnit: 2
      tabSize: 2
    editor.on 'keyup', (cm, change)=>
      cm = window["#{mode}_editor"]
      window.clearTimeout(window.send_text_timeout)
      window.send_text_timeout = window.setTimeout( (()->App.editor.sendText(mode, cm.getValue(), $('[data-project-id').data('projectId'))), 1200)
      window.allow_text_edits[mode] = false
      window.clearTimeout(window.set_text_edit_timer)
      window.set_text_edit_timer = window.setTimeout( (()-> window.allow_text_edits[mode] = true), 300)
      App.editor.evaluate()
    editor.getWrapperElement().style.display = 'none'
    return editor
