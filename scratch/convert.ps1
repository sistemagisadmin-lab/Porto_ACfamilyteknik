Add-Type -AssemblyName System.Drawing

$inputPath = "D:\PROJEK UPIN\SISTEMAGIS\AC-COMPRO\public\assets\logo.png"
$outputPath = "D:\PROJEK UPIN\SISTEMAGIS\AC-COMPRO\public\assets\logo-black.png"
$faviconPng = "D:\PROJEK UPIN\SISTEMAGIS\AC-COMPRO\public\favicon.png"

$img = [System.Drawing.Bitmap]::FromFile($inputPath)
$newImg = New-Object System.Drawing.Bitmap($img.Width, $img.Height)

for ($x = 0; $x -lt $img.Width; $x++) {
    for ($y = 0; $y -lt $img.Height; $y++) {
        $pixel = $img.GetPixel($x, $y)
        if ($pixel.A -gt 0) {
            $newColor = [System.Drawing.Color]::FromArgb($pixel.A, 0, 0, 0)
            $newImg.SetPixel($x, $y, $newColor)
        } else {
            $newImg.SetPixel($x, $y, [System.Drawing.Color]::FromArgb(0, 0, 0, 0))
        }
    }
}

$img.Dispose()
$newImg.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
$newImg.Save($faviconPng, [System.Drawing.Imaging.ImageFormat]::Png)
$newImg.Dispose()
Write-Host "Logo converted to black successfully!"
