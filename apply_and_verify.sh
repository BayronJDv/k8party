#!/bin/bash


# Function to extract label and namespace from yaml file
extract_info() {
    local file=$1
    local label=$(grep -A1 "labels:" "$file" | grep "app:" | awk '{print $2}')
    local namespace=$(grep "namespace:" "$file" | awk '{print $2}')
    echo "$label:$namespace"
}

echo "Applying all YAML manifests..."

# Store the current directory
root_dir=$(pwd)

# Find all directories containing pods
pod_dirs=$(find . -type d -name "*pods")

for dir in $pod_dirs; do
    cd "$root_dir/$dir"
    echo "Processing directory: $dir"
    
    # Apply all YAML files in the directory
    for yaml_file in *.yaml; do
        if [ -f "$yaml_file" ]; then
            echo "Applying $yaml_file"
            kubectl apply -f "$yaml_file"
            
            # Extract label and namespace
            info=$(extract_info "$yaml_file")
            label=$(echo "$info" | cut -d':' -f1)
            namespace=$(echo "$info" | cut -d':' -f2)
            
            if [ ! -z "$label" ] && [ ! -z "$namespace" ]; then
                echo "Verifying pod with label app=$label in namespace $namespace"
                kubectl get pods -l app=$label -o wide -n $namespace
                echo "-----------------------------------"
            fi
        fi
    done
done

echo "All manifests have been applied and verified!"