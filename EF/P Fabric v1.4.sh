
###
https://hyperledger-fabric.readthedocs.io/en/latest/whatsnew.html#serviceability-and-operations-improvements


FAB-3388 - Operational metrics for Fabric components
The peer and orderer have been instrumented to provide basic operational
metrics. The metrics can be surfaced for consumption by Prometheus or StatsD.


docker  exec -it 6589e772f317 bash
etc/hyperledger/fabric
core.yaml

apt-get update
apt-get install vim

=================================================================================
:
:
:
:
:
######################################################################
#########
#
#    Metrics section
#
######################################################################
#########
metrics:
    # metrics provider is one of statsd, prometheus, or disabled
    provider: disabled

    # statsd configuration
    statsd:
        # network type: tcp or udp
        network: udp

        # statsd server address
        address: 127.0.0.1:8125

        # the interval at which locally cached counters and gauges are
 pushed
        # to statsd; timings are pushed immediately
        writeInterval: 10s

        # prefix is prepended to all emitted statsd metrics
        prefix:


===================================================================================
docker exec -it peer0.org1.example.com bash

wget http://127.0.0.1:9443/logspec

cat /etc/hyperledger/fabric/core.yaml |grep -A 10 operations:
operations:
    # host and port for the operations server
    listenAddress: 127.0.0.1:9443

    # TLS configuration for the operations endpoint
    tls:
        # TLS enabled
        enabled: false

        # path to PE

cat logspec
===================================================================================

cat /etc/hyperledger/fabric/core.yaml tail -A 10

/opt/gopath/src/github.com/hyperledger/fabric/peer

curl http://orderer.example.com:9442/metrics

vi /etc/hyperledger/fabric/core.yaml 



### 

/logspecจุดปลายบนบันทึกช่วยให้บุคลากร O&M สามารถตั้งค่าหรือรับระดับการบันทึกสำหรับโหนดเพียร์และลำดับ

/healthzปลายทางช่วยให้ผู้ดำเนินการหรือบริการการจัดวางคอนเทนเนอร์ตรวจสอบกิจกรรมและสภาพของเพียร์และผู้สั่ง

/metricsปลายทางช่วยให้ผู้ปฏิบัติงานใช้ประโยชน์Prometheusจากเมทริกการดำเนินงานที่ได้รับจากเพียร์และโหนดผู้สั่งซื้อ ตัวบ่งชี้การปฏิบัติงานสามารถโพสต์ได้ที่StatsD


### start network

docker exec -it peer0.org1.example.com bash

### can not use 'curl'

wget http://peer0.org1.example.com:9443/logspec

http://orderer.example.com:9443/logspec


The current list of system chaincodes:

LSCC Lifecycle system chaincode handles lifecycle requests described above.
CSCC Configuration system chaincode handles channel configuration on the peer side.
QSCC Query system chaincode provides ledger query APIs such as getting blocks and transactions.

MVCC (Multiversion concurrency control)




































































































