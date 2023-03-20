
sleep 20

bash integrations/kafka-src/bin/connect-standalone.sh \
    integrations/configuration/connect-standalone.properties \
    integrations/configuration/sink-connector.properties
