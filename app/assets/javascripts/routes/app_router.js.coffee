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
    index: Em.Route.extend
      route: '/'
      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet('posts', App.Post.find())
    show: Em.Route.extend
      route: '/:post_id'
      connectOutlets: (router, post) ->
        postsController = router.get('postsController')
        postsController.connectOutlet('post', post)

