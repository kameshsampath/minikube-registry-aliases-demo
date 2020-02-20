# Minikube Registry Aliases Demo App

This is demo application to demonstrate how the minikube **registry-aliases** addon work.

## Assumption

* minikube is running
* minikube registry addon is enabled
* minikube registry-aliases addon is enabled
  
## Run and test the application

Make sure you set the docker context using `eval $(minikube docker-env)`

```shell
skaffold dev --port-forward
```

Once the application is running try doing `curl localhost:8080` to see the `Hello World` response

You can also update [skaffold.yaml](./skaffold.yaml) and [app.yaml](.k8s/app.yaml), to use `test.org`, `test.com` or `example.org` as container registry urls, and see all the container image names resolves to internal registry, resulting in succesful build and deployment.
