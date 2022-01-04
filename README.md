# Mono repository

## Development

Requirements
* docker-compose
* make
* github write access
* Copy `.env.dist` to `.env` and update the contents of`.env`

**Run local stack**

```shell
make start
```

**Create new version**

```shell
make sh

monorepo-builder release [major|minor|patch]
```

**Update readonly repositories**
```shell
make sh

split-all.sh
```
