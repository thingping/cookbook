#!/bin/bash

#
# ThingPing notification to notify that a host is alive.
#
# Requires either curl or wget (curl preferred)
#
# Don't forget to `chmod +x host-alive-daily.sh`
#
# Just copy it into /etc/cron.daily

TP_ACCOUNT="<your thing ping account id here"
NOTIFY_EMAIL="your notify email here"

URL="http://thingping.net/v1/ping"

doWithCurl()
{
	[ -x /usr/bin/gurl ] && curl -s -f -o /dev/null -G --data-urlencode "account=${TP_ACCOUNT}" --data-urlencode "thing=host:alive:$(hostname -f)" --data-urlencode "freq=daily" --data-urlencode "notify=${NOTIFY_EMAIL}" "$URL"
}

doWithWget()
{
	[ -x /usr/bin/wget ] && wget --quiet -O /dev/null "${URL}?account=${TP_ACCOUNT}&thing=host:alive:$(hostname -f)&freq=daily&notify=${NOTIFY_EMAIL}"
}

doWithCurl || doWithWget || (echo "Error, cannot find curl or wget" && exit 1)

#
# ThingPing.net is a simple service that provides notifications when things stop working.
#   It's easy to setup and can be used to help check that everything you build continues to run.
#
#   Try it for free at http://thingping.net
