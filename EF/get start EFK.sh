
EFK
@@@@@@@@@@@@@@

###1 Installing & Running Elasticsearch

1.1 Java Installation

1.2 Installing && RUN Elasticsearch

###2 Installing & Running Kibana

2.1 Installing && RUN Kibana

###3 Installing & Running Fluentd

@@@@@@@@@@@@@@
Docker Logs with Fluentd and ElasticSearch on Ubuntu 16.04

###1 Installing Fluentd

#Install td-agent :

\curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent2.sh -o install-td-agent.sh

#Read script :

nano install-td-agent.sh

#Run script :

sh install-td-agent.sh 

#Start td-agent :
 
sudo systemctl start td-agent

#Check the logs to make sure it was installed successfully :

tail /var/log/td-agent/td-agent.log

#Output
===============================================
    port 8888
  </source>
  <source>
    @type debug_agent
    bind 127.0.0.1
    port 24230
  </source>
</ROOT>
2016-12-02 19:45:31 +0000 [info]: listening fluent socket on 0.0.0.0:24224
2016-12-02 19:45:31 +0000 [info]: listening dRuby uri="druby://127.0.0.1:24230" object="Engine"
===============================================

#install the Elasticsearch plugin for Fluentd using the td-agent-gem :

sudo td-agent-gem install fluent-plugin-elasticsearch

###2 Configuring Fluentd
#จะรวบรวมข้อมูลจากที่ใดและส่งที่ไหน กำหนดกฎระเบียบเหล่านี้ในแฟ้มการกำหนดค่า
#ลบเนื้อหาของไฟล์ คุณจะเขียนกฎของคุณเองตั้งแต่เริ่มต้น
sudo nano /etc/td-agent/td-agent.conf 

# /etc/td-agent/td-agent.conf
===============================================
<source>
  @type forward
  port  24224
</source>
===============================================
#สิ่งนี้กำหนดแหล่งที่มาforwardซึ่งเป็นโปรโตคอล Fluentd ที่ทำงานบน TCP และจะถูกใช้โดย Docker 
#เมื่อส่งบันทึกไปยัง Fluentd

#including time, tag, message, container_id
#กำหนดmatchส่วนที่ตรงกับเนื้อหาของtagฟิลด์และกำหนดเส้นทางให้เหมาะสม
===============================================
<match docker.**>
  @type elasticsearch
  logstash_format true
  host 127.0.0.1
  port 9200
  flush_interval 5s
</match>
===============================================
#กฎนี้กล่าวว่าบันทึกที่มีแท็กหน้าด้วยทุกdocker.จะถูกส่งไปยัง ElasticSearch ซึ่งทำงานอยู่ในพอร์ต127.0.0.1 9200 #flush_intervalFluentd จะบอกความถี่ที่ควรบันทึกไปยัง Elasticsearch
**เมื่อคุณบันทึกไฟล์กำหนดค่าใหม่ให้เริ่ม td-agent บริการใหม่เพื่อให้มีการเปลี่ยนแปลง
sudo systemctl restart td-agent



###3 Starting the Elasticsearch 

#increase the value of max_map_count
sudo sysctl -w vm.max_map_count=262144

#Elasticsearch image and start the container
docker run -d -p 9200:9200 -p 9300:9300 elasticsearch


###4 Generating Logs from a Docker Container


docker run --log-driver=fluentd ubuntu /bin/echo 'Hello world'

curl -XGET 'http://localhost:9200/_all/_search?q=Hello world test'
curl -XGET  'http://localhost:9200/_cluster/health'
_cluster/stats?human&pretty 
_nodes/stats
_nodes/hot_threads
_nodes/stats/indices
_nodes/stats/os,process
_nodes/usage
http://localhost:9200/_nodes/_local/stats

Get http://elasticsearch:9200/_cluster/health




ใช้บันทึกเป็นกระแสข้อมูลผ่าน
อินเตอร์เฟสมาตรฐาน ( STDOUT) และ
ข้อผิดพลาด ( STDERR) ( อินเตอร์เฟส) 

### Start Grafana
sudo systemctl daemon-reload && sudo systemctl start grafana-server && sudo systemctl status grafana-server


sudo /etc/init.d/td-agent status



### Run API on Docker from docker images

docker run \
 --log-driver=fluentd \
 --log-opt fluentd-address=127.0.1.1:24224\
 --log-opt tag="docker-test-best" \
 --name docker-test-best -p 80:3000 nochawin/firstimage



### Fluentd_Exporter
#Fluentd exporter uses the fluentd monitoring agent api

docker pull vect0r/fluentd_exporter

=======================
 <source>
    @type monitor_agent
    bind 0.0.0.0
    port 24220
 </source>
=======================
ps w -C ruby -C td-agent

curl http://localhost:24220/api/plugins.json

docker run -it -p 9309:9309 vect0r/fluentd_exporter -scrape_uri localhost:24224

### Elasticsearch Exporter
#docker pull justwatch/elasticsearch_exporter:1.0.2



###Hyperledger 1.4 Configuring Metrics Prometheus
Fabric peer and orderer expose metrics 
can use this information to better understand how the system is performing over time.


Fabric provides two ways to expose metrics: a pull model based on Prometheus and a push model based on StatsD.


Peer & Orderer

docker exec -it c83926e45886 bash
docker exec -it <container> bash
apt-get update
apt-get install vim

core.yml
###############################################################################
metrics:
    # metrics provider is one of statsd, prometheus, or disabled
    provider: prometheus

    # statsd configuration
    statsd:
        # network type: tcp or udp
        network: udp

        # statsd server address
        address: 127.0.0.1:8125

        # the interval at which locally cached counters and gauges are pushed
        # to statsd; timings are pushed immediately
        writeInterval: 10s

        # prefix is prepended to all emitted statsd metrics
        prefix:





find . | grep <key w>




























































