App.RevealView = Em.View.extend
  # Extract 'controller.reveal' into own property.
  revealBinding: 'controller.reveal'
  # Method name is just a convention.
  revealChanged: ( ->
    if (@get('reveal'))
      @$('.reveal-modal').reveal()
      # Don't forget to change back to false
      @set('reveal', false)
  ).observes('reveal')
