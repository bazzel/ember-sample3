DS.Adapter.map 'App.Post',
  category:
    embedded: 'load'

App.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create
    plurals:
      'category': 'categories'
