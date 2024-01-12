For Linux or macOS users who have Docker installed, the execution of the following commands is recommended:

```shell
wget https://raw.githubusercontent.com/thingsboard/tbmq/{{ site.release.broker_branch }}/msa/tbmq/configs/tbmq-install-and-run.sh &&
sudo chmod +x tbmq-install-and-run.sh && ./tbmq-install-and-run.sh
```
{: .copy-code}

## Look this


```json
{
  "broker": {
    "name": "Demo Broker",
    "host": "host.docker.internal",
    "port": 1884,
    "clientId": "ThingsBoard_gateway",
    "version": 5,
    "maxMessageNumberPerWorker": 10,
    "maxNumberOfWorkers": 100,
    "sendDataOnlyOnChange": false,
    "security": {
      "type": "anonymous"
    }
  },
  "mapping": [
    {
      "topicFilter": "data/",
      "converter": {
        "type": "json",
        "deviceNameJsonExpression": "Demo Device",
        "deviceTypeJsonExpression": "default",
        "sendDataOnlyOnChange": false,
        "timeout": 60000,
        "attributes": [
          {
            "type": "integer",
            "key": "frequency",
            "value": "${frequency}"
          },
          {
            "type": "integer",
            "key": "power",
            "value": "${power}"
          }
        ],
        "timeseries": [
          {
            "type": "integer",
            "key": "temperature",
            "value": "${temperature}"
          },
          {
            "type": "integer",
            "key": "humidity",
            "value": "${humidity}"
          }
        ]
      }
    }
  ],
  "connectRequests": [
    {
      "topicFilter": "sensor/connect",
      "deviceNameJsonExpression": "${SerialNumber}"
    },
    {
      "topicFilter": "sensor/+/connect",
      "deviceNameTopicExpression": "(?<=sensor\/)(.*?)(?=\/connect)"
    }
  ],
  "disconnectRequests": [
    {
      "topicFilter": "sensor/disconnect",
      "deviceNameJsonExpression": "${SerialNumber}"
    },
    {
      "topicFilter": "sensor/+/disconnect",
      "deviceNameTopicExpression": "(?<=sensor\/)(.*?)(?=\/disconnect)"
    }
  ],
  "attributeRequests": [],
  "attributeUpdates": [],
  "serverSideRpc": []
}
```
{:.copy-code.expandable-20}

## After code block

{% capture sigfoxuplinkconverterconfig %}
TBEL<small>Recommended</small>%,%accessToken%,%templates/integration/sigfox/sigfox-uplink-converter-config-tbel.md%br%
JavaScript<small></small>%,%anonymous%,%templates/integration/sigfox/sigfox-uplink-converter-config-javascript.md{% endcapture %}

{% include content-toggle-inner.liquid toggle-id="sigfoxuplinkconverterconfig" toggle=sigfoxuplinkconverterconfig %}


