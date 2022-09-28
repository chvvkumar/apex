
## Neptune Apex Grafana Dashboard:

A TIG stack config to monitor [Neptune Systems' Apex series of aquarium controllers](https://www.neptunesystems.com/)

## Dashboard:

The JSON dashboard can be found within this repo. Import it into your grafana instance.

![image](https://user-images.githubusercontent.com/16548147/188246451-89074388-e97a-4db1-9d9c-3a8362d06fc4.png)



## Prerequisites:
Installed and working Influxdb, Grafana and Telegraf

For newer Apex:
Nothing needs changing. My A3 Apex worked right out of the box.

For Apex Classic:
"Open XML Access" on your Apex controller should be enabled. This setting can be found in the configuration > Network Setup section

![Apex Settings](https://i.imgur.com/hb9kzKL.png)

3. Telegraf should be at at-least version 1.9.3
(Credit to [Max Renaud](https://github.com/MaxRenaud))

## Telegraf input plugin configuration:

Replace the "apex.lan" with your apex controller host name. Here I am using two Apex controllers.

    ###############################################################################
    
    # INPUT PLUGINS #
    
    ###############################################################################
    
    #Apex Aquarium Controller
    [[inputs.neptune_apex]]
    servers = [
                    "http://apex.lan:1982",
                    "http://a3apexjr.lan"
            ]    
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
