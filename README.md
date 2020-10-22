# recipes

## Getting started

Start a hasura instance via docker:
```bash
$ docker-compose up -d
```

Install hasura CLI:
```bash
$ npm install --global hasura-cli
```

To apply the db migrations run:
```bash
$ hasura migrate apply
```

Launch the console - this will automatically update the metadata here if it's edited in the console
```bash
$ hasura console
```
