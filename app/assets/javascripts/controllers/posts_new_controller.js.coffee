App.PostsNewController = Em.ObjectController.extend
  create: ->
    record = @get('content')
    record.one 'didCreate', @, ->
      @get('target').transitionTo('posts')
    record.get('transaction').commit()
