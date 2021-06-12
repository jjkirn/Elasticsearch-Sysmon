#
# JJK 6/12/21 - Script to check all the Elasticsearch docker containers
#   related to my Sysmon instance are running OK
#
#sudo systemctl is-active kibana logstash elasticsearch filebeat
docker container ps
sudo netstat -antp | grep LISTEN | egrep "5601|9200|5044"

