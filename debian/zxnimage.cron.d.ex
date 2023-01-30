#
# Regular cron jobs for the zxnimage package.
#
0 4	* * *	root	[ -x /usr/bin/zxnimage_maintenance ] && /usr/bin/zxnimage_maintenance
