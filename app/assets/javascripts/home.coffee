$(document).ready ->
  if window.location.pathname.length < 2
    # set text color if saved from previous visit
    if window.localStorage['color']?
      $('.home h1').css('color', window.localStorage['color'])
    # change color when text is clicked
    $('.home h1').on 'click', (e)->
      colors = ['white','black','red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet', 'pink', 'orangered', 'fuchsia', 'aqua', 'blueviolet', 'coral', 'chartreuse', 'deeppink', 'deepskyblue', 'springgreen', 'tomato']
      # get random color from colors array
      color = colors[Math.floor(Math.random()*colors.length)]
      # save color
      window.localStorage['color'] = color
      # update css
      $('.home h1').css('color', color)

    $(window).on 'mousemove', (e)->
      # maxmimum shadow distance
      max_shadow = 40
      # get center position
      h1_dimensions = document.querySelector('h1').getBoundingClientRect()
      center_x = h1_dimensions.x + h1_dimensions.width / 2
      center_y = h1_dimensions.y + h1_dimensions.height / 2
      # calculate shadows from mouse position
      shadow_x = (center_x - e.clientX) / (max_shadow * 2)
      shadow_y = (center_y - e.clientY) / (max_shadow * 2)
      # keep shadow distabce less than max_shadow
      shadow_x = Math.min(max_shadow, Math.max(-max_shadow, shadow_x))
      shadow_y = Math.min(max_shadow, Math.max(-max_shadow, shadow_y))
      # calculate shadow radius
      shadow_radius = Math.abs(shadow_x) + Math.abs(shadow_y)
      $('.home h1').css('textShadow', "#{shadow_x}px #{shadow_y}px #{shadow_radius}px rgba(0,0,0,0.25)")

  $('header #logo a').css('color', window.localStorage['color'])