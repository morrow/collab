$(window).on 'mousemove', (e)->
  # maxmimum shadow distance
  max_shadow = 50
  # get center window position
  center_x = window.innerWidth / 2
  center_y = window.innerHeight / 2
  # calculate shadows from mouse position
  shadow_x = (center_x - e.clientX) / (max_shadow * 2)
  shadow_y = (center_y - e.clientY) / (max_shadow * 2)
  # keep shadow distabce less than max_shadow
  shadow_x = Math.min(max_shadow, Math.max(-max_shadow, shadow_x))
  shadow_y = Math.min(max_shadow, Math.max(-max_shadow, shadow_y))
  # calculate shadow radius
  shadow_radius = Math.abs(shadow_x) + Math.abs(shadow_y)
  $('#somie').css('textShadow', "#{shadow_x}px #{shadow_y}px #{shadow_radius}px rgba(0,0,0,0.25)")

$(document).ready ->
  # set text color if saved from previous visit
  if window.localStorage['color']?
    $('#somie').css('color', window.localStorage['color'])
  # change color when text is clicked
  $('#somie').on 'click', (e)->
    colors = ['white','black','red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet', 'pink', 'orangered', 'fuchsia', 'aqua', 'blueviolet', 'coral', 'chartreuse', 'deeppink', 'deepskyblue', 'springgreen', 'tomato']
    # get random color from colors array
    color = colors[Math.floor(Math.random()*colors.length)]
    # save color
    window.localStorage['color'] = color
    # update css
    $('#somie').css('color', color)
