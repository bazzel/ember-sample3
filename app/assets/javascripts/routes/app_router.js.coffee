App.Router = Em.Router.extend
  enableLogging: true
  location: 'hash'
  root: Em.Route.extend
    index: Em.Route.extend
      route: '/'
      redirectsTo: 'posts.index'

  posts: Em.Route.extend
    route: '/posts'
    showPost: Em.Route.transitionTo 'posts.show'
    editPost: Em.Route.transitionTo 'posts.edit'
    index: Em.Route.extend
      route: '/'
      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet('posts', App.Post.find())
    show: Em.Route.extend
      route: '/:post_id'
      connectOutlets: (router, post) ->
        postsController = router.get('postsController')
        postsController.connectOutlet('post', post)
    edit: Em.Route.extend
      # SETUP
      route: '/:post_id/edit'
      connectOutlets: (router, post) ->
        transaction = router.get('store').transaction()
        transaction.add post
        postsController = router.get('postsController')

        postsController.set('transaction', transaction)
        postsController.connectOutlet
          viewClass: App.EditPostView
          controller: router.get('postController')
          context: post
      # EVENTS
      unroutePath: (router, path) ->
        router.get('postsController.transaction').rollback()
        @_super(router, path)
      # STATES
    cancel: (router, event) ->
      router.get('postsController.transaction').rollback()
      router.transitionTo('show')
    save: (router, event) ->
      router.get('postsController.transaction').commit()
      router.transitionTo('show')
    delete: (router, event) ->
      post = event.context
      if confirm("Are you sure you want to delete the post with title '#{post.get('title')}'?")
        post.deleteRecord()
        post.store.commit()
        App.router.transitionTo 'posts.index'
