The goal of this repository is to show how we can create a new container image
that is based on Apicurio Registry but also includes a pre-packaged .zip file 
containing all of the schemas in the repository.  The .zip file will be of the
Apicurio Registry import/export format.

Here are the steps we need to follow in our "create-registry.yml" GitHub workflow
to make this happen:

1. Start a local instance of Apicurio Registry without any authentication or authorization enabled, using in-memory persistence.
2. Use the Apicurio Registry maven plugin to register all of the schemas in the local Registry instance.
3. Invoke the /apis/registry/v3/admin/export REST API endpoint to download a .zip file containing all of the artifacts registered in (2).
4. Shut down the local instance of Apicurio Registry.
5. Build a new docker container image using apicurio-registry as a base image, and including the .zip file created in (3), configured to be imported when Registry starts up.

To accomplish these steps, we need a "pom.xml" file at the root of this project that is configured with
the apicurio-registry-maven-plugin to register all of the schemas.

We also need a new Dockerfile that uses `apicurio/apicurio-registry` as a base image, but also includes
the .zip file in the image and configures the registry to import the zip on startup.

If you want to know how to configure Apicurio Registry to import a .zip file on startup, you 
can look at the ImportExportConfigProperties class in the "app" module.  That contains all of
the relevant configuration properties.