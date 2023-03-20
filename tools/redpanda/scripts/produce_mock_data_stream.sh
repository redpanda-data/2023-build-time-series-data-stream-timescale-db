TOPIC_NAME=mock-payments
DATA_HOST_NAME=generator_endpoint
DATA_ADVERTISED_PORT=8989
DATA_HOST=${DATA_HOST_NAME}:${DATA_ADVERTISED_PORT}

# Delete all existing topics
rpk topic delete -r '.*'

# Create topic
rpk topic create ${TOPIC_NAME}

# Produce into the topic
while true
do
  echo "Producing activity records into the $TOPIC_NAME using $DATA_HOST."
  temp_data=$(curl -X GET ${DATA_HOST})
  uuid=$(cat /proc/sys/kernel/random/uuid)
  echo "${temp_data}" | rpk topic produce ${TOPIC_NAME} --key "${uuid}"
  sleep 2
done;
