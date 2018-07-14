$(document).ready ->
  # create code mirror editors from text boxes
  for language in ['html', 'css', 'javascript'] 
    editor_name = "#{language}_editor"
    if $("##{editor_name}")
      window[editor_name] = new Editor(language, $("##{editor_name}")[0])
  # listen for editor switch actions
  $('#editor-switcher button').on 'click', (e)=>
    App.editor.switchCodeMirror(e.target.getAttribute('data-mode'))
  $('[data-behavior=room_speaker]').on 'keypress', (e)->
    if e.keyCode is 13
      App.editor.sendMessage(@value, $('[data-project-id]').data('projectId'))
      @value = ''
  # scroll chat  
  if $('#chat').length
    $('#chat')[0].scrollTop = $('#chat')[0].scrollHeight
  # listen for pop state
  window.onpopstate = (e)=>
    App.editor.switchCodeMirror(e.state.mode, false)
  # initial code switch
  if window.location.pathname.match /javascript|css|html/
    App.editor.switchCodeMirror(window.location.pathname.split('/')[window.location.pathname.split('/').length - 1])
  else
    $('#editor-switcher [data-mode=javascript]').click()
  # run code
  App.editor.evaluate()
