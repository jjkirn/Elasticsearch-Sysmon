#
# JJK 6/12/21 - Script to restart all the Elasticsearch docker containers
#   related to my Sysmon instance
#
echo "Restarting docker containers es, logstash, kibana, and nginx - please wait!"
#
# make sure the /es container is stopped
echo "Stopping container /es"
docker container stop /es
# remove the stopped container to avoid any conflicts
echo "Removing container /es"
docker container rm /es
# run the new container
echo "Creating new container /es"
docker run --user esuser --name es -d -p 9200:9200 -v /data:/home/esuser/data es_image

# make sure the /logstash container is stopped
echo "Stopping container /logstash"
docker container stop /logstash
# remove the stopped container to avoid any conflicts
echo "Removing container /logstash"
docker container rm /logstash
# run the new container
echo "Creating new container /logstash"
docker run -d --name logstash -p 5044:5044 --link es:es logstash_image

# make sure the /kibana container is stopped
echo "Stopping container /kibana"
docker container stop /kibana
# remove the stopped container to avoid any conflicts
echo "Removing container /kibana"
docker container rm /kibana
# run the new container
echo "Creating new container /kibana"
docker run --name kibana --link es:es -d -p 5601:5601 --link es:es kibana_image

# make sure the /nginx container is stopped
echo "Stopping container /nginx"
docker container stop /nginx
# remove the stopped container to avoid any conflicts
echo "Removing container /nginx"
docker container rm /nginx
# run the new container
echo "Creating new container /nginx"
docker run --name nginx -d -p 80:80 -p 443:443 --link logstash:logstash -v /docker_nginx:/var/log/nginx -v /docker_syslog:/var/log/syslog nginx_image

# list all running containers
docker container ps

