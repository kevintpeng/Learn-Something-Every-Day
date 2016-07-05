# Cron 
Cron is a unix utility for scheduling scripts. Cron can be used via `crontab` or found in `/etc` folders with `hourly`, `daily`,`weekly`, `monthly` suffixes.

To setup, run `crontab -e` to edit a user's crontab.

Set the task time to some time where your computer is likely on and connected to internet. For example: `00 20 * * * sh Please-My-Friends/please-my-friends.sh`. This will run the shell script at 8:00pm every day.

crontabs use the following syntax:

`m h dom mon dow cmd` (minute, hour, day of month, month, day of week, command)
