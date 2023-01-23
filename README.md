# Drupal Deploy with Ansble Playbooks

This repos contains self-contained playbooks to be used with [AWS Systems Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html) to deploy new versions of a Drupal project.

## Playbook: deploy-git.yml

This playbook handles the deploy of git-based projects, which as of Feb 2023 is the current standard of NyMedia/Frontkom deploys.
It can handle both tags and branches using git checkout.

### Playbook's variables

| Name | Description | Default |
--------------------------------
| `repo_root` | Git repo root, absolute path | "/var/www/html" |
| `drupal_root` | Drupal root dir, absolute path | repo_root + "/drupal" |
| `git_ref` | Version to deploy, must be a valid git ref (tag ro branch) | "master" |
| `sql_dump_timeout` | Timeout _(in seconds)_ for the drush sql dump | 60 |
| `git_repo_url` | Git repository URL, if not provided will be fetched from `repo_root` | _Undefined_ |
