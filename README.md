# Axway APIM-CLI GitHub Action

This action helps you to use the [Axway APIM CLI](https://github.com/Axway-API-Management-Plus/apim-cli) in a GitHub Actions workflow. You can import APIs, Applications, Organizations, and Users into an API-Manager in Batch-Mode based on a specified directory structure. 

Additionally, you can call the APIM CLI directly with a given command according to your needs.  

## Inputs

## `command`

Run an APIM-CLI command. For example: 'apim api get -h api.demo.axway.com -u serviceaccount -p ${{ secrets.password }}'. 

## Example usage

```yaml
    - name: Get all applications
      uses: Axway-API-Management-Plus/apim-cli-github-action@v1.14.8
        with:
          command: apim api get -h api.demo.axway.com -u serviceaccount -p ${{ secrets.password }}
        env:
          LOG_LEVEL: 'DEBUG'
```

```yaml
    - name: Import APIs
      uses: Axway-API-Management-Plus/apim-cli-github-action@v1.14.8
        with:
          command: "apim api import -c api-config.json -a api.json -h maverick.demo.axway.com -u apiadmin -p ${{ secrets.password }}"
```
