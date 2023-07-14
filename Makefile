

apply_develop:
	oc apply -f admin-cluster/components/projects/develop
	oc apply -f admin-cluster/components/applicationsets/develop


generate_all:
	cookiecutter templates/namespace-config-repo-incl -f -o namespace-config/namespaces/ --no-input app_name=greet-app
	cookiecutter templates/microservice-git-config-repo -f -o . --no-input app_name=greet-app
	cookiecutter templates/argo-components-incl -f -o . --no-input app_name=greet-app
	cp -r greet-app-argo-boot/projects/*  admin-cluster/components/projects
	cp -r greet-app-argo-boot/applicationsets/* admin-cluster/components/applicationsets
