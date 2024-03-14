# my_epitest

Epitech Epitest Docker configured with *fish* shell.

See [Epitech/epitest-docker](https://github.com/Epitech/epitest-docker) for the repository of Epitech Epitest Docker.

## Usage

Build the Dockerfile
```bash
docker build -t epitest .
```

Make a symbolic link to `run.sh` in a folder of your PATH (or make an alias)
```bash
cd ~/.local/bin/
ln -s <my_epitest location>/run.sh epitest
```

Use it
```bash
epitest
```

To have a custom hostname, set the `ET_HOSTNAME` environment variable
