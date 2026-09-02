$logoBytes = [IO.File]::ReadAllBytes('c:\Users\rekha\ideathon\logo.jpg')
$logoB64 = [Convert]::ToBase64String($logoBytes)
[IO.File]::WriteAllText('c:\Users\rekha\ideathon\logo_only.txt', $logoB64)

$bannerBytes = [IO.File]::ReadAllBytes('c:\Users\rekha\ideathon\banner.jpg')
$bannerB64 = [Convert]::ToBase64String($bannerBytes)
[IO.File]::WriteAllText('c:\Users\rekha\ideathon\banner_only.txt', $bannerB64)

Write-Host "Done! Logo: $($logoB64.Length) chars, Banner: $($bannerB64.Length) chars"
