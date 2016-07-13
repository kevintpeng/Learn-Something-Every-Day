# Rewrite Module
Used to change request URI using regexs, return redirects, conditional configurations. Processed in the following order:
- first, directives of this module that are specified in the server context are executed sequentially
- then each location is searched based on a request URI
  - directives of the rewrite module in the location context are executed sequentially
  - the loop is repeated if a request URI was rewritten
  
