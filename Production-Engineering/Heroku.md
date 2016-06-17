# Heroku
- `heroku restart`
- `heroku pg:backups`
- `heroku pg:backups schedule --at '02:00 America/Los_Angeles'`

### Dynos

### Procfile
- mechanism for declaring what commands are run by your application's dynos
- `heroku ps` displays the number of dynos that are executing
- `heroku ps:scale worker=1` will start one worker dyno

### Rake Tasks
Rakes taks are executed as **one-off dynos**, in the same environment as the app's dyno.
