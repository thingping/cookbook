# Host Alive

ThingPing notification that a host is alive.

Note: there is a 'daily' version of the script if that is more suitable.

## Usage (cron.hourly)

Most Linux distributions have a cron scheduler that supports script directories like "cron.hourly"

Instructions for use (using the "hourly" version in this example)

1. copy the script into /etc/cron.hourly `sudo wget -O /etc/cron.hourly/host-alive-hourly.sh https://raw.githubusercontent.com/thingping/cookbook/master/Linux_and_MacOS/host-alive/host-alive-hourly.sh`
2. edit the file to change your ThingPing account ID and your email for expiry notifications
3. `sudo chmod +x /etc/cron.hourly/host-alive-hourly.sh`

## Usage (MacOS and crontab)

If you are on MacOS or want to use a custom schedule then do the following:

1. Create a directory
`sudo mkdir -p /opt/thingping/`
    

2. Get the script
`sudo wget -O /opt/thingping/host-alive-hourly.sh https://raw.githubusercontent.com/thingping/cookbook/master/Linux_and_MacOS/host-alive/host-alive-hourly.sh`

3. Edit the file to change your ThingPing account ID and your email for expiry notifications.  
`sudo nano /opt/thingping/host-alive-hourly.sh`

4. Add execute permisisons
`sudo chmod +x /opt/thingping/host-alive-hourly.sh`

5. Edit the crontab
`EDITOR=nano crontab -e`
and add the exact line
`0 * * * * /opt/thingping/host-alive-hourly.sh`
