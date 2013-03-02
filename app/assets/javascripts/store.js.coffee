DS.RESTAdapter.map 'App.Post',
  category:
    embedded: 'load'
  comments:
    embedded: 'load'
  trackbacks:
    embedded: 'load'

DS.RESTAdapter.configure('plurals',
  'category': 'categories'
)
App.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create()
