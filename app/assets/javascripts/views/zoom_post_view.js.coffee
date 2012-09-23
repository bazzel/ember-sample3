App.ZoomPostView = Em.View.extend
  click: ->
    App.router.revealController.set('content', @content)
    $('#myModal').reveal()
