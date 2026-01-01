# mlhome-ha

Home Assistant docker compose stack.

## Usage

1. Copy the provided `.env.example` to `.env` and update it.
2. Copy the provided `configuration.yaml.example` to `configuration.yaml` in `volumes/zigbee2mqtt/data/` and update it.
3. Start the stack:
   ```
   sudo make up
   ```
4. Create desired mosquitto users:
   ```
   sudo make passwd USERNAME=ha     # for HomeAssistant
   sudo make passwd USERNAME=z2m    # for zigbee2mqtt
   ...
   ```
