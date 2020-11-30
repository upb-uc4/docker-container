```bash
docker build --tag uc4official/webhook:v0.13.0 .
docker run --name webhook -p 9000:80 -v /var/run/docker.sock:/var/run/docker.sock --network="kind" --env LAGOM_TOKEN=SFlx8cUl9c1Pz4Ja --env UI_TOKEN=lBdkHZnW6YovvLuD uc4official/webhook:v0.13.0
```