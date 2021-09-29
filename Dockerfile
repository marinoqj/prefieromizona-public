FROM busybox:latest
ADD prefieromizona-public.war prefieromizona-public.war
CMD "tail" "-f" "/dev/null"