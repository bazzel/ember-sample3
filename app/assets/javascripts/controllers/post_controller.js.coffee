App.PostController = Em.ObjectController.extend
  needs: ['reveal']
  deletePost: ->
    if confirm("Are you sure you want to delete the post with title '#{@get('title')}'?")
      record = App.Post.find(@get('id'))
      transaction = @get('store').transaction()
      transaction.add(record)
      record.deleteRecord()
      transaction.commit()
      record.one 'didDelete', @, ->
        @transitionToRoute('posts')
