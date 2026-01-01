# mlhome-ha

Home automation services docker compose configuration.

## Usage

1. Copy the provided .env.example to .env and fill it out.
2. Create the volume directories you specified in the .env.
3. Start it up:
   ```
   $ docker compose up -d --env-file .env -f mlhome-ha.yaml
   ```
