### Here is some headind

The Server UI can be accessed through the following URL: `http://localhost:8080`.
Log in using the username **tenant@thingsboard.org** and password **tenant**.
Throughout this tutorial, we will refer to this URL as **SERVER_URL**.

The ThingsBoard **Edge** UI is accessible at `http://localhost:18080`.
Use the same credentials: username **tenant@thingsboard.org** and password **tenant**.
This URL will be referred to as **EDGE_URL** in the subsequent sections of the tutorial.

### Next will be code-block

{% capture requestConf %}
{
  "host": "http://127.0.0.1:5000",
  "SSLVerify": true,
  "security": {
    "type": "basic",
    "username": "user",
    "password": "password"
  },
  "mapping": [
    {
      "url": "getdata",
      "httpMethod": "GET",
      "httpHeaders": {
        "ACCEPT": "application/json"
      },
      "allowRedirects": true,
      "timeout": 0.5,
      "scanPeriod": 5,
      "converter": {
        "type": "json",
        "deviceNameJsonExpression": "SD8500",
        "deviceTypeJsonExpression": "SD",
        "attributes": [
          {
            "key": "serialNumber",
            "type": "string",
            "value": "${serial}"
          }
        ],
        "telemetry": [
          {
            "key": "Maintainer",
            "type": "string",
            "value": "${Developer}"
          }
        ]
      }
    },
    {
      "url": "get_info",
      "httpMethod": "GET",
      "httpHeaders": {
        "ACCEPT": "application/json"
      },
      "allowRedirects": true,
      "timeout": 0.5,
      "scanPeriod": 100,
      "converter": {
        "type": "custom",
        "deviceNameJsonExpression": "SD8500",
        "deviceTypeJsonExpression": "SD",
        "extension": "CustomRequestUplinkConverter",
        "extension-config": [
          {
            "key": "Totaliser",
            "type": "float",
            "fromByte": 0,
            "toByte": 4,
            "byteorder": "big",
            "signed": true,
            "multiplier": 1
          },
          {
            "key": "Flow",
            "type": "int",
            "fromByte": 4,
            "toByte": 6,
            "byteorder": "big",
            "signed": true,
            "multiplier": 0.01
          }
        ]
      }
    }
  ],
  "attributeUpdates": [
      {
        "httpMethod": "POST",
        "httpHeaders": {
          "CONTENT-TYPE": "application/json"
        },
        "timeout": 0.5,
        "tries": 3,
        "allowRedirects": true,
        "deviceNameFilter": "SD.*",
        "attributeFilter": "send_data",
        "requestUrlExpression": "sensor/${deviceName}/${attributeKey}",
        "valueExpression": "{\"${attributeKey}\":\"${attributeValue}\"}"
      }
  ],
  "serverSideRpc": [
    {
      "deviceNameFilter": ".*",
      "methodFilter": "echo",
      "requestUrlExpression": "sensor/${deviceName}/request/${methodName}/${requestId}",
      "responseTimeout": 1,
      "httpMethod": "GET",
      "valueExpression": "${params}",
      "timeout": 0.5,
      "tries": 3,
      "httpHeaders": {
        "Content-Type": "application/json"
      }
    },
    {
      "deviceNameFilter": ".*",
      "methodFilter": "no-reply",
      "requestUrlExpression": "sensor/${deviceName}/request/${methodName}/${requestId}",
      "httpMethod": "POST",
      "valueExpression": "${params}",
      "httpHeaders": {
        "Content-Type": "application/json"
      }
    }
  ]
}

{% endcapture %}
{% include code-toggle.liquid code=requestConf params="conf|.copy-code.expandable-20" %}

### nd here is image gallery

{% assign createChirpstackIntegration = '
    ===
        image: /images/devices-library/basic/integrations/chirpstack/1-create-integration.png,
        title: Go to **Integrations**, press **plus** button and choose **Chirpstack** as a type, put some name.
    ===
        image: /images/devices-library/basic/integrations/chirpstack/2-create-integration-uplink.png,
        title: Check **Create new uplink data converter** and replace a code or create the existing one.
    ===
        image: /images/devices-library/basic/integrations/chirpstack/3-create-integration-configuration.png,
        title: Put your **Application server URL** and **API Key** from Chirpstack and copy **HTTP endpoint URL**, Click on **Add** button.
    ===
        image: /images/devices-library/basic/integrations/chirpstack/application-integrations.png,
        title: Open your Chirpstack, go to **Applications** -> Your application -> **Integrations** tab.
    ===
        image: /images/devices-library/basic/integrations/chirpstack/create-application-integration.png,
        title: Scroll down and click on **+** under **HTTP** tile. Put **HTTP URL endpoint** into **Event Endpoint URL(s)** field and click on **Submit** button.
'
%}

To add integration click on '**+**' button and follow the next steps:  

{% include images-gallery.liquid showListImageTitles="true" imageCollection=createChirpstackIntegration %} 

