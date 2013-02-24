App.PostController = Em.ObjectController.extend
  needs: ['reveal']
  deletePost: ->
    if confirm("Are you sure you want to delete the post with title '#{@get('title')}'?")
      record = @content
      record.deleteRecord()
      record.get('transaction').commit()
      record.one 'didDelete', @, ->
        @transitionToRoute('posts')
