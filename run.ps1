# Variables
$global:IMAGE_NAME = "ai_project"
$global:CONTAINER_NAME = "mycontainer"
$global:PORT = 8501

# Function to build Docker image
function Build-Image {
    docker build -t $global:IMAGE_NAME .
}

# Function to run Docker container
function Run-Container {
    docker run -d -p $global:PORT:8501 --name $global:CONTAINER_NAME $global:IMAGE_NAME
}

# Function to stop Docker container
function Stop-Container {
    docker stop $global:CONTAINER_NAME
}

# Function to remove Docker container
function Remove-Container {
    docker rm $global:CONTAINER_NAME
}

# Function to clean (stop and remove) Docker container
function Clean-Container {
    Stop-Container
    Remove-Container
}

# Function to show Docker container logs
function Show-Logs {
    docker logs $global:CONTAINER_NAME
}

# Get the action from command line arguments
$action = $args[0]

# Perform action based on input
switch ($action) {
    "build" { Build-Image }
    "run" { Run-Container }
    "stop" { Stop-Container }
    "rm" { Remove-Container }
    "clean" { Clean-Container }
    "logs" { Show-Logs }
    default { Write-Host "Unknown action: $action" }
}