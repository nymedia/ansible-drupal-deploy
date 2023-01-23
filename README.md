# Drupal Deploy with Ansble Playbooks

This repos contains self-contained playbooks to be used with [AWS Systems Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html) to deploy new versions of a Drupal project.

## Playbook: deploy-git.yml

This playbook handles the deploy of git-based projects, which as of Feb 2023 is the current standard of NyMedia/Frontkom deploys.
It can handle both tags and branches using git checkout.

### Playbook's variables

| Name | Required | Description | Default |
|------|----------|-------------|---------|
| `deploy_repo_root` | No | Git repo root, absolute path | "/var/www/html" |
| `deploy_drupal_root` | No | Drupal root dir, absolute path | repo_root + "/drupal" |
| `deploy_git_branch` | Yes* | Branch name to deploy | _Undefined_ |
| `deploy_git_tag` | Yes* | Git tag to deploy | _Undefined_ |
| `drush_sqldump_timeout` | No | Timeout _(in seconds)_ for the drush sql dump | 60 |
| `git_repo_url` | No | Git repository URL, if not provided will be fetched from `repo_root` | _Undefined_ |

#### About `deploy_git_branch` and `deploy_git_tag`

One, and only one, MUST be defined for the playbook to work.
If either _both or none_ are defined the deployment will fail.
