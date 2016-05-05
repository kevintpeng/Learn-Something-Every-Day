# Artoo
Javascript, in browser scraper. [source](https://medialab.github.io/artoo/)
```javascript
artoo.scrape('td.title:nth-child(3)', {
  title: {sel: 'a'},
  url: {sel: 'a', attr: 'href'}
}, artoo.savePrettyJson);
```

### Spiders
