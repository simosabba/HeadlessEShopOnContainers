# Add the Sitecore MyGet repository to PowerShell
#Register-PSRepository -Name SitecoreGallery -SourceLocation https://sitecore.myget.org/F/sc-powershell/api/v2

# Install the Sitecore Install Framwork module
#Install-Module SitecoreInstallFramework

# Install the Sitecore Fundamentals module (provides additional functionality for local installations like creating self-signed certificates)
#Install-Module SitecoreFundamentals

# Import the modules into your current PowerShell context (if necessary)
Import-Module SitecoreFundamentals
Import-Module SitecoreInstallFramework

#define parameters 
$prefix = "sc902-hd"
$SetupFolder = "C:\Sitecore\Installation\Sitecore 9.0.2 rev. 180604 (WDP XP0 packages)"
$XConnectCollectionService = "$prefix.xconnect"
$sitecoreSiteName = "$prefix.local"
$SolrUrl = "https://solr:8983/solr"
$SolrRoot = "C:\solr\solr-6.6.2"
$SolrService = "solr-6.6.2"
$SqlServer = "localhost"
$SqlAdminUser = "scAdmin"
$SqlAdminPassword = "b" 
 
#install client certificate for xconnect 
$certParams = 
@{     
    Path = "$SetupFolder\xconnect-createcert.json"     
    CertificateName = "$prefix.xconnect_client" 
} 
Install-SitecoreConfiguration @certParams -Verbose

#install solr cores for xdb 
$solrParams = 
@{
    Path = "$SetupFolder\xconnect-solr.json"     
    SolrUrl = $SolrUrl    
    SolrRoot = $SolrRoot  
    SolrService = $SolrService  
    CorePrefix = $prefix
} 
Install-SitecoreConfiguration @solrParams -Verbose

#deploy xconnect instance 
$xconnectParams = 
@{
    Path = "$SetupFolder\xconnect-xp0.json"     
    Package = "$SetupFolder\Sitecore 9.0.2 rev. 180604 (OnPrem)_xp0xconnect.scwdp.zip"
    LicenseFile = "$SetupFolder\license.xml"
    Sitename = $XConnectCollectionService   
    XConnectCert = $certParams.CertificateName    
    SqlDbPrefix = $prefix  
    SqlServer = $SqlServer  
    SqlAdminUser = $SqlAdminUser
    SqlAdminPassword = $SqlAdminPassword
    SolrCorePrefix = $prefix
    SolrURL = $SolrUrl      
} 
Install-SitecoreConfiguration @xconnectParams -Verbose

#install solr cores for sitecore 
$solrParams = 
@{
    Path = "$SetupFolder\sitecore-solr.json"
    SolrUrl = $SolrUrl
    SolrRoot = $SolrRoot
    SolrService = $SolrService     
    CorePrefix = $prefix 
} 
Install-SitecoreConfiguration @solrParams -Verbose
 
#install sitecore instance 
$sitecoreParams = 
@{     
    Path = "$SetupFolder\sitecore-XP0.json"
    Package = "$SetupFolder\Sitecore 9.0.2 rev. 180604 (OnPrem)_single.scwdp.zip" 
    LicenseFile = "$SetupFolder\license.xml"
    SqlDbPrefix = $prefix  
    SqlServer = $SqlServer  
    SqlAdminUser = $SqlAdminUser     
    SqlAdminPassword = $SqlAdminPassword     
    SolrCorePrefix = $prefix  
    SolrUrl = $SolrUrl     
    XConnectCert = $certParams.CertificateName     
    Sitename = $sitecoreSiteName         
    XConnectCollectionService = "https://$XConnectCollectionService"    
} 
Install-SitecoreConfiguration @sitecoreParams -Verbose