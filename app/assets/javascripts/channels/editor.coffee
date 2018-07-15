App.editor = App.cable.subscriptions.create "EditorChannel",

  connected: ->
    console.log 'connected'

  disconnected: ->
    console.log 'disconnected'

  received: (data) ->
    if data['text']?
      @evaluate()
      if window.allow_text_edits[data['mode']]
        editor = window["#{data['mode']}_editor"]
        cursor = editor.getCursor()
        scroll_top = editor.getScrollerElement().scrollTop
        editor.setValue(unescape(unescape(data['text'])))
        editor.setCursor(cursor)
        editor.getScrollerElement().scrollTop = scroll_top
    else if data['message']
      current_user_id = $('#chat').data('current-user')
      $('#messages').append data['message']
      if $('#messages .message:last-child').data('user-id') ==  current_user_id
        $('#messages .message:last-child')[0].dataset.currentUser = ''
      $('#chat')[0].scrollTop = $('#chat')[0].scrollHeight

  sendText:(mode, text, project_id=0)->
    @perform 'sendText',
      project_id: project_id
      mode: mode
      text: escape(text)

  sendMessage:(content, project_id)->
    @perform 'sendMessage',
      content: content
      project_id: project_id

  switchCodeMirror:(mode, push=true)->
    $('.CodeMirror').hide()
    window.history.pushState({mode: mode}, '', window.location.pathname.replace(/html|css|javascript/g, '').replace(/\/+$/g, '') + "/#{mode}") if push
    $("#editor-switcher [data-mode]").removeClass 'current'
    window["#{mode}_editor"].getWrapperElement().style.display = 'block'
    # console.log(window["#{mode}_editor"].getWrapperElement())
    $("#editor-switcher [data-mode=#{mode}]").addClass 'current'

  evaluate: ->
    try
      $('#output').removeClass 'error'
      html = document.createElement('div')
      html.innerHTML = window.html_editor.getValue()
      $('#output').html('')
      $('#output')[0].appendChild(html)
      javascript = window.javascript_editor.getValue()
      eval(unescape(unescape(javascript)))
      $('#custom-style-tag').html window.css_editor.getValue()
    catch e
      $('#output').addClass 'error'
      $('#output').text e