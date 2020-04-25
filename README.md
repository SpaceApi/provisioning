# provisioning

Provisioning for the SpaceAPI infrastructure.

## prerequisite

You need ansible, gopass and terraform >= 0.12 installed to run this project
You also need the terraform provider `terraform-provider-njalla`. [Download it](https://github.com/gidsi/terraform-provider-njalla/releases) and add it to your `~/.terraform.d/plugins` folder.

## deployment

You can use the `deploy` script for easier deployment.

### What does it do?

The script deployes the whole spaceapi infrastructure, including domain records, servers, permissions and the complete software
stack.

Its split up in three major parts: persistent, nodes and deployment.

* Persistent is for resources that have to be persistent (e.g. storage mostly).

* Nodes contains the ephemeral part of the infrastructure.

* Deployment contains the software (besides the OS, that's defined in `nodes`) that we want to run on our systems.

## environments

The deploy script takes care of the different environments.

The switch is implemented in the `nodes` part. There you can run `terraform workspace select ENVIRONMENT` right now
we've set up two different environments, dev and prod. Dev is for testing purposes and prod is the production
environment.

## Things to do
* Adding another ssh key recreates all machines.
* volume ids have to be transfered manually into the environment files.
