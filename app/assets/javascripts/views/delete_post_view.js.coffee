App.DeletePostView = Em.View.extend
  templateName: 'delete_post'
  tagName: 'span'
  mouseUp: (event) ->
    post = @get('content')
    if confirm("Are you sure you want to delete the post with title '#{post.get('title')}'?")
      post.deleteRecord()
      post.store.commit()
      # App.router.transitionTo 'posts.index'
