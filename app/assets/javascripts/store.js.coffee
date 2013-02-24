DS.Adapter.map 'App.Post',
  category:
    embedded: 'load'

DS.RESTAdapter.configure('plurals',
  'category': 'categories'
)
App.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create()
