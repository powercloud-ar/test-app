#!/bin/bash

PAYLOAD=$(cat <<EOF
{
  "name": "$1 $2-$3",
  "frequencyMin": 0,
  "enabled": true,
  "type": "BROWSER",
  "createdFrom": "GUI",
  "script": {
    "type": "clickpath",
    "version": "1.0",
    "configuration": {
      "device": {
        "deviceName": "Desktop",
        "orientation": "landscape"
      },
      "chromiumStartupFlags": {
        "disable-web-security": false
      }
    },
  "events": [{
        "type": "navigate",
        "wait": {
            "waitFor": "page_complete"
        },
        "description": "Loading of \"https://tienda.rocketcloud.io/\"",
        "url": "https://tienda.rocketcloud.io/"
    }],
  "anomalyDetection": {
    "outageHandling": {
      "globalOutage": true,
      "globalOutagePolicy": {
        "consecutiveRuns": 1
      },
      "localOutage": false,
      "localOutagePolicy": {
        "affectedLocations": null,
        "consecutiveRuns": null
      },
      "retryOnError": true
    },
    "loadingTimeThresholds": {
      "enabled": true,
      "thresholds": []
    }
  },
  "tags": [
   "$1-$3"
  ],
  "managementZones": [],
  "automaticallyAssignedApps": [],
  "manuallyAssignedApps": [],
  "keyPerformanceMetrics": {
    "loadActionKpm": "VISUALLY_COMPLETE",
    "xhrActionKpm": "VISUALLY_COMPLETE"
  },
  "events": []
}
EOF
)
echo $PAYLOAD
curl -H "Content-Type: application/json" -H "Authorization: Api-Token ${4}" -X POST -d "${PAYLOAD}" ${5}/api/v1/synthetic/monitors
