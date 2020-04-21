param ( 
    [string]$target = $(throw "-target is required")
)

$webconfigs = @( "Checkmarx Access Control", "Checkmarx Results Service", "Checkmarx Web RestAPI\CxRestAPI\bin", "Checkmarx Web RestAPI\CxRestAPI", "Checkmarx Web Services\CxWebInterface", "CheckmarxWebPortal\Web\app", "CheckmarxWebPortal\Web" )

foreach ( $path in $webconfigs ) {
    if ( -not (Test-Path -Path $path) ) {
        $OUT = mkdir $path
    }
    $file = "\\" + $target + "\d$\Program Files\Checkmarx\" + $path + "\web.config" 
    $dest = $path + "\" + $target + "-web.config"
    Copy-Item -Path $file -Destination $dest 
}

if ( -not (Test-Path -Path "Windows\System32\inetsrv\config") ) {
    $OUT = mkdir "Windows\System32\inetsrv\config"    
}
$file = "\\" + $target + "\c$\Windows\System32\inetsrv\config\applicationHost.config"
$dest = "Windows\System32\inetsrv\config\" + $target + "-applicationHost.config"
Copy-Item -Path $file -Destination $dest

