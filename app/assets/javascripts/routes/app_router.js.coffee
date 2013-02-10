App.Router.map ->
  @resource 'posts', ->
    @route 'show',
      path: '/:post_id'

App.ApplicationRoute = Em.Route.extend
  events:
    openModal: (content, controller) ->
      controller.set('content', content)
      $('#myModal').reveal()

App.IndexRoute = Em.Route.extend
  redirect: ->
    @transitionTo 'posts'

App.PostsRoute = Em.Route.extend
  model: ->
    App.Post.find()

#App.Router = Em.Router.extend
  #enableLogging: true
  #location: 'hash'
  #root: Em.Route.extend
    #index: Em.Route.extend
      ## SETUP
      #route: '/'
      #redirectsTo: 'posts'

    #posts: Em.Route.extend
      ## SETUP
      #route: '/posts'
      #initialState: 'index'
      ## EVENTS
      #showPost: Em.Route.transitionTo 'show'
      #editPost: Em.Route.transitionTo 'edit'
      #newPost: Em.Route.transitionTo 'new'
      #savePost: (router, event) ->
        #post = event.context
        #post.transaction.commit()
        #router.transitionTo('show', post)
      #deletePost: (router, event) ->
        #post = event.context
        #if confirm("Are you sure you want to delete the post with title '#{post.get('title')}'?")
          #post.deleteRecord()
          #post.transaction.commit()
          #router.transitionTo 'root.index'
      ## STATES
      #index: Em.Route.extend
        ## SETUP
        #route: '/'
        #connectOutlets: (router) ->
          #router.get('applicationController').connectOutlet('posts', App.Post.find())
          #router.get('applicationController').connectOutlet('reveal', 'reveal')
      #show: Em.Route.extend
        ## SETUP
        #route: '/:post_id'
        #initialState: 'index'
        #connectOutlets: (router, post) ->
          #router.get('postsController').connectOutlet('post', post)
          #router.get('postController').connectOutlet 'navigation', 'navigation', post
        ## EVENTS
        #showComments: Em.Route.transitionTo('comments')
        #showTrackbacks: Em.Route.transitionTo('trackbacks')
        ## STATES
        #index: Em.Route.extend
          #route: '/'
          #redirectsTo: 'comments'
        #comments: Em.Route.extend
          ## SETUP
          #route: '/comments'
          #connectOutlets: (router) ->
            #postController = router.get('postController')
            #postController.connectOutlet('comments', postController.get('comments'))
            #router.set('navigationController.selected', 'comments')
        #trackbacks: Em.Route.extend
          ## SETUP
          #route: '/trackbacks'
          #connectOutlets: (router) ->
            #postController = router.get('postController')
            #postController.connectOutlet('trackbacks', postController.get('trackbacks'))
            #router.set('navigationController.selected', 'trackbacks')
      #edit: Em.Route.extend
        ## SETUP
        #route: '/:post_id/edit'
        #connectOutlets: (router, post) ->
          #postsController = router.get('postsController')
          #postsController.connectOutlet
            #viewClass: App.EditPostView
            #controller: router.get('postController')
            #context: post
        ## EVENTS
        #unroutePath: (router, path) ->
          #router.get('postController.transaction').rollback()
          #@_super(router, path)
        #cancelPost: (router, event) ->
          #post = event.context
          #router.get('postController.transaction').rollback()
          #router.transitionTo('show', post)
      #new: Em.Route.extend
        ## SETUP
        #route: '/new'
        #connectOutlets: (router) ->
          #post = App.Post.createRecord()
          #postsController = router.get('postsController')
          #postsController.connectOutlet
            #viewClass: App.EditPostView
            #controller: router.get('postController')
            #context: post
        ## EVENTS
        #unroutePath: (router, path) ->
          #router.get('postController.transaction').rollback()
          #@_super(router, path)
        #cancelPost: (router, event) ->
          #router.get('postController.transaction').rollback()
          #router.transitionTo('root.index')

