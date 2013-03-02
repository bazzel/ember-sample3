App.PostsEditController = Em.ObjectController.extend
  update: ->
    #record = @content
    record = App.Post.find @get('id')
    record.one 'didUpdate', @, ->
      @get('target').transitionTo('post', record)
    if record.get('isDirty')
      record.get('transaction').commit()
    else
      @get('target').transitionTo('post', record)

