## Neptune Apex Grafana Dashboard:

A TIG stack config to monitor [Neptune Systems' Apex series of aquarium controllers](https://www.neptunesystems.com/)

## Demo:
https://grafana.challa.co/d/USuIX9_ik/aquarium-status?refresh=5s&orgId=1&kiosk

## Prerequisites:
1. Installed and working Inflixdb, Grafana and Telegrafa

2. "Open XML Access" on your Apex controller should be enabled. This setting can be found in the configuration > Network Setup section

3. Telegraf should be at at-least version 1.9.3

## Telegraf input plugin configuration:

Replace the "apex.lan" with your apex controller host name

    ###############################################################################
    
    # INPUT PLUGINS #
    
    ###############################################################################
    
    [[inputs.neptune_apex]]
    
    servers = [ "http://apex.lan" ]
    
    #response_timeout = "5s"
    
    ###############################################################################
    #                            PROCESSOR PLUGINS                                #
    ###############################################################################
    
    [[processors.enum]]
     namepass = ["neptune_apex"]
     [[processors.enum.mapping]]
      field = "state"
      dest = "state_code"
      default = 0
      [processors.enum.mapping.value_mappings]
       AON = 1
       ON  = 2
       AOF = 3
       OFF = 4



  

## Dashboard:

The JSON dashboard can be found within this repo. Import it into your grafana instance.

![Neptune Apex Grafana Dashboard](https://i.imgur.com/nDOifZn.png)

