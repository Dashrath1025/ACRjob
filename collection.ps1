# Path to Newman executable
$newmanPath = "newman"

# Path to exported Postman collection JSON file
$collectionFilePath = "C:\Users\Shailesh\Dropbox\PC\Downloads\run.json"

# Run Newman command to execute the collection and capture responses
$response =  newman run $collectionFilePath -r cli

# Display Newman output
Write-Output $response

# Parse Newman output to extract response details and display them
$response | Select-String -Pattern "Request:" -Context 0,2 | ForEach-Object {
    $_.Context.PostContext | ForEach-Object {
        Write-Output $_
        Write-Output ""
    }
}

