$logoB64 = [IO.File]::ReadAllText('c:\Users\rekha\ideathon\logo_only.txt').Trim()
$bannerB64 = [IO.File]::ReadAllText('c:\Users\rekha\ideathon\banner_only.txt').Trim()

$html = [IO.File]::ReadAllText('c:\Users\rekha\ideathon\index.html')

$logoDataUrl = "data:image/jpeg;base64,$logoB64"
$bannerDataUrl = "data:image/jpeg;base64,$bannerB64"

$html = $html.Replace('./logo.jpg', $logoDataUrl)
$html = $html.Replace('./banner.jpg', $bannerDataUrl)

[IO.File]::WriteAllText('c:\Users\rekha\ideathon\index.html', $html)
Write-Host "Done! File size: $([IO.File]::ReadAllBytes('c:\Users\rekha\ideathon\index.html').Length) bytes"
