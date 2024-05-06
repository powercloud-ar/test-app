#!/bin/bash
  PAYLOAD=$(cat <<EOF
{
  "enabled": true,
  "frequencyMin": 5,
  "name": "$1 $2-$3",
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
    "events": [
      {
        "type": "navigate",
        "wait": {
          "waitFor": "page_complete"
        },
        "description": "Loading of \"https://tienda.rocketcloud.io/\"",
        "url": "https://tienda.rocketcloud.io/"
      }
    ]
  },
  "anomalyDetection": {
    "loadingTimeThresholds": {
      "enabled": true,
      "thresholds": []
    },
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
    }
  },
  "keyPerformanceMetrics": {
    "loadActionKpm": "VISUALLY_COMPLETE",
    "xhrActionKpm": "VISUALLY_COMPLETE"
  },
  "tags": ["$1-$3"],
  "managementZones": [],
  "automaticallyAssignedApps": [],
  "manuallyAssignedApps": [],
  "locations": ["GEOLOCATION-924D253001531722"]
}
EOF
)
echo $PAYLOAD
curl -H "Content-Type: application/json" -H "Authorization: Api-Token ${4}" -X POST -d "${PAYLOAD}" ${5}/api/v1/synthetic/monitors
