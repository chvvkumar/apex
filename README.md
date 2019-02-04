Demo:

https://grafana.challa.co/d/USuIX9_ik/aquarium-status?refresh=5s&orgId=1&kiosk

Telegraf Config.:


    ###############################################################################
    #                            INPUT PLUGINS                                    #
    ###############################################################################
    [[inputs.neptune_apex]]
      servers = [ "http://apex.lan" ]
      #response_timeout = "5s"

Neptune Apex Grafana Dashboard:

![Neptune Apex Grafana Dashboard](https://i.imgur.com/YGdCHna.png)
