# joshes/awscli

AWS CLI tools from Docker.

## Usage

If you have a local configuration (e.g. ~/.aws) available to you or have [created](https://aws.amazon.com/blogs/security/a-new-and-standardized-way-to-manage-credentials-in-the-aws-sdks/) one, you can mount that as a volume.

For example:

```
docker run -v ~/.aws:/root/.aws joshes/awscli cloudformation list-stacks 
```

You can also add the credentials as environment variables like so:

```
docker run -e AWS_REGION=<region> -e AWS_ACCESS_KEY_ID=<key> -e AWS_SECRET_ACCESS_KEY=<secret> joshes/awscli cloudformation list-stacks
```
