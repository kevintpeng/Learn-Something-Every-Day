# Mostly Static Pages
Although rails is good at dynamic websites, it also excels at making *kind of static* pages with dynamic content.

`rails generate controller StaticPages home help ...`

Generates controller with home and help page setup in routes. `get 'static_pages/home` maps request for the URL `/static_pages/home` to the `home` action in the controller (through http verb `get`). 
