App.PostsNewController = Em.ObjectController.extend
  create: ->
    record = @content
    #record = App.Post.find @get('id')
    record.one 'didCreate', @, ->
      @get('target').transitionTo('posts')
    record.get('transaction').commit()
