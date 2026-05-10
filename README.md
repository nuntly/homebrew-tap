# nuntly/homebrew-tap

The official CLI for the [Nuntly](https://nuntly.com) REST API.

## Install

```bash
brew install nuntly/tap/nuntly
```

## Usage

```
$ nuntly --help
Usage: nuntly [options] [command]

Nuntly CLI - Developer-first email platform

Options:
  -V, --version       output the version number
  --profile <name>    Use a specific profile from ~/.nuntly/config.json
  -h, --help          display help for command

Commands:
  login [profile]     Save your API key to ~/.nuntly/config.json
  profiles            List configured profiles
  completion <shell>  Output shell completion script
  emails              Emails resource.
  domains             Domains resource.
  webhooks            Webhooks resource.
  organizations       Organizations resource.
  inboxes             Inboxes resource.
  agents              Agents resource.
  threads             Threads resource.
  messages            Messages resource.
  namespaces          Namespaces resource.
  api-keys            ApiKeys resource.
```

### Authenticate

Two ways. Pick one.

```bash
# Persisted profile in ~/.nuntly/config.json
nuntly login

# Or per-shell env var
export NUNTLY_API_KEY=ntly_...
```

### Send an email

```bash
nuntly emails send \
  --from hello@yourcompany.com \
  --to alice@example.com \
  --subject "Welcome" \
  --html "<h1>Hello</h1>"
```

### Create an API key

```bash
nuntly api-keys create --permission sendingAccess --name "production"
```

### List recent emails

```bash
nuntly emails list --format table
```

Run `nuntly <command> --help` for the full option list of any subcommand.
