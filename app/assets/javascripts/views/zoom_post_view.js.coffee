App.ZoomPostView = Em.View.extend
  click: ->
    @get('controller').send('openModal', @content)
