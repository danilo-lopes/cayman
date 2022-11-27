### Info

Emojivoto is open source microservice application example provided by DigitalOcean:

`https://github.com/digitalocean/kubernetes-sample-apps/tree/master/emojivoto-example`

### Requirements

- `helm`
- `kubectl`

### Deploying applications manually

The helm charts are stored on this repo so, you will deploy from source directory `helm-stack`.

```
kubectl create ns emojivoto
```

Emoji application
```
helm upgrade --install emoji ./emoji -n emojivoto
```

Voting application
```
helm upgrade --install voting ./voting -n emojivoto
```

Web application
```
helm upgrade --install web ./web -n emojivoto
```

Vote Bot application
```
helm upgrade --install vote-bot ./vote-bot -n emojivoto
```

```
NAME    	NAMESPACE	REVISION	UPDATED                             	STATUS  	CHART       	APP VERSION
emoji   	emojivoto	1       	2022-11-25 21:26:21.62623 -0300 -03 	deployed	emoji-v11   	v11
vote-bot	emojivoto	3       	2022-11-25 21:37:56.689196 -0300 -03	deployed	vote-bot-v11	v11
voting  	emojivoto	1       	2022-11-25 21:26:49.765925 -0300 -03	deployed	voting-v11  	v11
web     	emojivoto	1       	2022-11-25 21:26:58.635475 -0300 -03	deployed	web-v11     	v11
```

### Deploying applications automated

In `deploy` directory we have a terraform code to auto-provision all the applications

1. **configure provider.tf** to load EKS authentication from S3 bucket and **backend.tf** to store you terraform state

2. `terraform init`

3. `terraform plan`

4. `terraform apply`

```
data.terraform_remote_state.eks: Reading...
data.terraform_remote_state.eks: Read complete after 2s
helm_release.emojivoto["vote-bot"]: Refreshing state... [id=vote-bot]
helm_release.emojivoto["emoji"]: Refreshing state... [id=emoji]
helm_release.emojivoto["web"]: Refreshing state... [id=web]
helm_release.emojivoto["voting"]: Refreshing state... [id=voting]

Outputs:

charts_metadata = <sensitive>
```

### If you want to run helm tests on web application

***only web helm chart have tests***

`helm test web -n emojivoto --timeout=1m`

```
NAME: web
LAST DEPLOYED: Sun Nov 27 09:41:17 2022
NAMESPACE: emojivoto
STATUS: deployed
REVISION: 1
TEST SUITE:     web-test-svc
Last Started:   Sun Nov 27 09:42:16 2022
Last Completed: Sun Nov 27 09:42:21 2022
Phase:          Succeeded
NOTES:
Thank you for installing web emojivoto stack.

Your release is named web.

To learn more about the release, try:

  $ helm status web
  $ helm get all web
```