App.PostEditController = Em.ObjectController.extend
  update: ->
    #record = @content
    record = App.Post.find @get('id')
    record.one 'didUpdate', @, ->
      @get('target').transitionTo('post.show', record)
    if record.get('isDirty')
      record.get('transaction').commit()
    else
      @get('target').transitionTo('post.show', record)
  deletePost: ->
    if confirm("Are you sure you want to delete the post with title '#{@get('title')}'?")
      #record = @content
      record = App.Post.find @get('id')
      record.deleteRecord()
      record.get('transaction').commit()
      record.one 'didDelete', @, ->
        @transitionToRoute('posts')

