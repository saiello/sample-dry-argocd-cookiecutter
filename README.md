# Sample Dry Argocd Cookiecutter

Sample project showing how to use ArgoCD Polyrepo repository with Cookiecutter to reduce boilerplate code writing.


For sake of simplicity all the cose is here but following folders should be considered as separate repository:
- templates: contains cookiecutter templates
- admin-cluster: repository intended for cluster admin, responsible to setup Argo CRD and other cluster wide stuff 
- namespace-config: repository to collect namespace configuration 
- "app-config-repo": separate repository for each application using a microservice based architeture


# Quickstart

```
cookiecutter templates/namespace-config-repo-incl -o namespace-config/namespaces/ --no-input app_name=vote-app
```

```
cookiecutter templates/microservice-git-config-repo -o . --no-input app_name=vote-app
```

```
cookiecutter templates/argo-components-incl -o . --no-input app_name=vote-app
```

```
cp -r vote-app-argo-boot/projects/*  admin-cluster/components/projects
cp -r vote-app-argo-boot/applicationsets/* admin-cluster/components/applicationsets
```

NOTE: would be nice to use cookiecutter [post generation hooks](https://cookiecutter.readthedocs.io/en/stable/advanced/hooks.html) to avoid manual copy 




# Definitions

## Monorepo

In a monorepo environment, all the manifests for the entire environment, including
end-user applications, cluster configuration, and cluster bootstrapping, are stored in a
single Git repository.

## Polyrepo

A polyrepo environment contains multiple repositories, possibly to support many
clusters or deployment environments. The basic idea is that a single cluster can have
multiple repositories configured as a source of truth.




# Config Map Generators Alternatives


```
configMapGenerator:
- envs:
  - application.env
  name: quarkus-app-envs
```

```
configMapGenerator:
- files:
  - application.properties
  name: quarkus-app-envs
```

```
configMapGenerator:
- literals:
  - QUARKUS_FOOBAR=sample
  name: quarkus-app-envs
```

