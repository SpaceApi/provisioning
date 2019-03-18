# provisioning

Provisioning for the SpaceAPI infrastructure.

## Deployment

You can use the `deploy` script for easier deployment.

To deploy a specific role:

    ./deploy -t <role>

To do a "dry-run" deployment, use the `--check` option. To see changes, use the
`--diff` option.

    ./deploy -t <role> --diff --check
