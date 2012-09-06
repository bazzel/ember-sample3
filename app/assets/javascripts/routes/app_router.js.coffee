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
    createPost: Em.Route.transitionTo 'create'
    index: Em.Route.extend
      route: '/'
      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet('posts', App.Post.find())
    show: Em.Route.extend
      route: '/:post_id'
      connectOutlets: (router, post) ->
        postsController = router.get('postsController')
        postsController.connectOutlet('post', post)
      showComments: Em.Route.transitionTo('comments')
      comments: Em.Route.extend
        route: '/comments'
        connectOutlets: (router) ->
          postController = router.get('postController')
          postController.connectOutlet('comments', postController.get('comments'))
    edit: Em.Route.extend
      # SETUP
      route: '/:post_id/edit'
      connectOutlets: (router, post) ->
        postsController = router.get('postsController')
        postsController.connectOutlet
          viewClass: App.EditPostView
          controller: router.get('postController')
          context: post
      # EVENTS
      unroutePath: (router, path) ->
        router.get('postController.transaction').rollback()
        @_super(router, path)
      # STATES
      cancel: (router, event) ->
        post = event.context
        router.get('postController.transaction').rollback()
        router.transitionTo('show', post)
    create: Em.Route.extend
      route: '/new'
      connectOutlets: (router) ->
        post = App.Post.createRecord()
        postsController = router.get('postsController')

        postsController.connectOutlet
          viewClass: App.EditPostView
          controller: router.get('postController')
          context: post
      # EVENTS
      unroutePath: (router, path) ->
        router.get('postController.transaction').rollback()
        @_super(router, path)
      # STATES
      cancel: (router, event) ->
        router.get('postController.transaction').rollback()
        router.transitionTo('index')

    save: (router, event) ->
      post = event.context
      post.transaction.commit()
      router.transitionTo('show', post)
    delete: (router, event) ->
      post = event.context
      if confirm("Are you sure you want to delete the post with title '#{post.get('title')}'?")
        post.deleteRecord()
        post.transaction.commit()
        App.router.transitionTo 'posts.index'
