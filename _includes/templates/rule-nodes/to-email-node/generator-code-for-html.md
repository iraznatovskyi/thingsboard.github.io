Example of generator JS code
```js
var metadata = { userEmail: 'info@thingsboard.org', isHtml: true };
var msgType = "POST_TELEMETRY_REQUEST";
return { msg: {}, metadata: metadata, msgType: msgType }
```
{% include images-gallery.html imageCollection="html_generator" %}

{% capture contenttogglespec2 %}
Live Demo<br><small>Connect edge to https://demo.thingsboard.io</small>%,%cloud%,%templates/edge/ce-cloud.md%br%
On-premise server<br><small>Connect edge to on-premise instance</small>%,%on-premise%,%templates/edge/on-premise-cloud.md{% endcapture %}
{% include content-toggle-inner.liquid toggle-id="cloudType" toggle=contenttogglespec2 %}
