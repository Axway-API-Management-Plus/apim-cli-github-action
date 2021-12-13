# Axway APIM-CLI GitHub Action

This action helps them use the Axway APIM CLI in a GitHub Actions workflow. You can import APIs, applications, organizations, and users into an API manager based on a specified directory structure. 
Alternatively, you can call the APIM CLI directly according to your needs.

## Inputs

## `apimHostname`

**Required** The hostname of the API-Manager to use.

## `apimUsername`

**Required** The username to use for the API-Manager.

## `apimPassword`

**Required** The password to use for the API-Manager.

## `apimPort`

The API-Manager port.

## `apimExtraArgs`

**Required** Some extra parameters which should be used by the APIM-CLI. For instance '-port 443', '-force' or '-returnCodeMapping 10:0'

## `apiDirectory`

The directory containing your APIs. Each API in a separate directory.

## `orgDirectory`

The directory containing your organizations. Each organization in a separate directory.

## `appDirectory`

The directory containing your applications. Each application in a separate directory.

## `userDirectory`

The directory containing your users. Each user in a separate directory.

## `apimCLICommand`

Run an APIM-CLI command. For example: 'apim api check-certs'. You may combine this with apimExtraArgs depending on you the command you use.

## Example usage

```yaml
    - name: Import APIs and Applications
      uses: Axway-API-Management-Plus/apim-cli-github-action@v1.5.1
        with:
          apimHostname: 'manager.customer.com'
          apimUsername: 'apiadmin'
          apimPassword: '1234567890'
          apimExtraArgs: '-port 443 -force -returnCodeMapping 10:0'
          apiDirectory: 'axway/api-management/APIs'
          appDirectory: 'axway/api-management/Apps'
        env:
          BACKEND_HOST: 'http://mocked-apis:8280'
```

```yaml
    - name: Validate certificates
      uses: Axway-API-Management-Plus/apim-cli-github-action@v1.5.1
        with:
          apimHostname: '${{ github.event.inputs.apimHost }}'
          apimPort: "443"
          apimUsername: ${{ github.event.inputs.apimUsername }}
          apimPassword: ${{ github.event.inputs.apimPassword }}
          apimCLICommand: 'api check-certs'
          apimExtraArgs: '-days 60'
```