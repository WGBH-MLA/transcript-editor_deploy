# Open Vault Code Deployment

This is the Capistrano project that deploys code and ingests records for
[transcript-editor](https://github.com/WGBH/transcript-editor),
a website maintained by WGBH Media Library and Archives.

This documentation is intended for use by WGBH-MLA staff. It is not expected to
to work for the general public.

## Prerequisites

Before deploying, ensure the following:
  * **The target host has been created, is running on AWS, and has been
    fully provisioned.** (Click [here](https://github.com/WGBH/mla-playbooks)
    for inforamtion on provisioning servers for transcript-editor)
  * **You have the private key required to SSH into the host.**

## Setup your local copy of the deployment repository

1. **Clone the repository**
  ```
  git clone https://github.com/WGBH/transcript-editor_deploy.git
  cd transcript-editor_deploy
  ```

1. **Get the private key for accessing the target host with SSH and set the permissions**

  The private key must be securely obtained from a WGBH-MLA developer. By
  convention, the name will correspond to a set of AWS resources, in particular
  an AWS keypair. Keep the private key in your `~/.ssh/` directory, with
  permissions set appropriately:

    ```
    chmod 600 ~/.ssh/xyz.wgbh-mla.org.pem
    ```

1. **Run `bundle install`**

  If `bundle install` runs successfully, then you should be able to run a deployment or ingest records.

## Deploy

From the root directory of your cloned repo, run the capistrano command for the `aws` stage. This step could take a few minutes.

```
bundle exec cap aws deploy TRANSCRIPT_HOST=1.2.3.4 TRANSCRIPT_SSH_KEY=~/.ssh/xyz.wgbh-mla.org.pem
```

If there were no errors, then you should be able to see the transcript-editor website running in a web browser, at the target host's IP address.
If there were errors, or if you can't see the running website, then please [file a bug](https://github.com/WGBH/transcript-editor_deploy/issues).

## TODO

error notification. issue #32.
