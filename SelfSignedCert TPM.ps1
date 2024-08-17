# Create a self-signed certificate, store in TPM

[X509Certificate] $cer = New-SelfSignedCertificate `
    -Subject "CN=$env:COMPUTERNAME Entra ID Script Authentication" `
    -KeyAlgorithm RSA `
    -KeyLength 2048 `
    -CertStoreLocation Cert:\LocalMachine\My `
    -KeyExportPolicy NonExportable `
    -Provider 'Microsoft Platform Key Storage Provider' `
    -NotAfter (Get-Date).AddYears(1)
Export-Certificate -Type CERT -Cert $cer -FilePath 'C:\AzureScriptAuthentication.cer'  -Force 

#dir Cert:\LocalMachine\My | fl
#dir Cert:\CurrentUser\My | fl
#install-module microsoft.graph -Scope CurrentUser
#Connect-MgGraph -Certificate xxxx
