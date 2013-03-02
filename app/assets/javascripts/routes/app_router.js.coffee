App.Router.map ->
  @resource 'posts', ->
    @route 'new',
    @resource 'post',
      path: '/:post_id'
    , ->
      @route 'edit'
      @resource 'comments'
      @resource 'trackbacks'

App.ApplicationRoute = Em.Route.extend
  events:
    openModal: (content, controller) ->
      controller.set('content', content)
      controller.set('reveal', true)
    deletePost: (model) ->
      record = App.Post.find model.get('id')
      if confirm("Are you sure you want to delete the post with title '#{record.get('title')}'?")
        record.deleteRecord()
        record.get('transaction').commit()
        record.one 'didDelete', @, ->
          @transitionTo('posts')

App.IndexRoute = Em.Route.extend
  redirect: ->
    @transitionTo 'posts'

App.PostsRoute = Em.Route.extend
  model: ->
    App.Post.find()

App.PostsNewRoute = Em.Route.extend
  model: ->
    transaction = @get('store').transaction()
    transaction.createRecord App.Post
  setupController: (controller, model) ->
    controller.set('categories', App.Category.find())
  deactivate: ->
    @currentModel.get('transaction').rollback()

App.PostEditRoute = Em.Route.extend
  model: ->
    @modelFor 'post'
  setupController: (controller, model) ->
    controller.set('categories', App.Category.find())
  deactivate: ->
    @currentModel.get('transaction')?.rollback()
  renderTemplate: ->
    @render
      into: 'posts'

App.CommentsRoute = Em.Route.extend
  setupController: (controller, model) ->
    comments = @controllerFor('post').get('comments')
    controller.set('content', comments)

App.TrackbacksRoute = Em.Route.extend
  setupController: (controller, model) ->
    trackbacks = @controllerFor('post').get('trackbacks')
    controller.set('content', trackbacks)
