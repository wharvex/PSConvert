function Convert-Markdown-To-Html($inputFile, $outputFile) {
    # Check if the input file exists
    if (-Not (Test-Path $inputFile)) {
        Write-Host "Input file does not exist."
        return
    }

    $md_info_obj = ConvertFrom-Markdown -Path $inputFile
    $md_info_obj.Html | out-file $outputFile

}

if ($MyInvocation.InvocationName -ne ".") {
    $testInputFile = "./test.md"
    $testOutputFile = "./test.html"
    if (Test-Path $testOutputFile) {
        Remove-Item $testOutputFile -verbose
    }
    Convert-Markdown-To-Html $testInputFile $testOutputFile
}
