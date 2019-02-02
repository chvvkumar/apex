#!/usr/bin/pwsh
function ConvertFrom-Xml {
  param([parameter(Mandatory, ValueFromPipeline)] [System.Xml.XmlNode] $node)
  process {
    if ($node.DocumentElement) { $node = $node.DocumentElement }
    $oht = [ordered] @{}
    $name = $node.Name
    if ($node.FirstChild -is [system.xml.xmltext]) {
      $oht.$name = $node.FirstChild.InnerText
    } else {
      $oht.$name = New-Object System.Collections.ArrayList 
      foreach ($child in $node.ChildNodes) {
        $null = $oht.$name.Add((ConvertFrom-Xml $child))
      }
    }
    $oht
  }
}

[xml[]](New-Object System.Net.WebClient).DownloadString("http://apex.lan:1982/cgi-bin/status.xml") | ConvertFrom-Xml | ConvertTo-Json -Depth 100

