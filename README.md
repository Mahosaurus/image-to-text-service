# image-to-text-service
Service to upload an image, and getting the text in it back

Steps to get it running in Azure:
- Provide Docker Registry and push to it
- Grant App Service all permissions to push and pull from Docker Registry
- Add all necessary secrets into Configuration
    - E.g. DOCKER_REGISTRY_SERVER_USERNAME
    - E.g. DOCKER_REGISTRY_SERVER_URL
    - E.g. DOCKER_REGISTRY_SERVER_PASSWORD
    - Port to be exposed is 8080
- In the deployment center: Select admin login for App Service (I think so at least)
